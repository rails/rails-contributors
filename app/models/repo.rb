require 'set'
require 'fileutils'

class Repo
  attr_reader :logger, :grit_repo

  # This is the entry point to update the database from a recent pull.
  def self.update(path, *branches)
    new(path).update(branches)
  end

  def initialize(path)
    @logger    = Rails.logger
    @grit_repo = Grit::Repo.new(path)
  end

  def git_fetch
    git_exec('fetch', 'origin', '--quiet')
  end

  def git_show(sha1)
    git_exec('show', sha1)
  end

  # TODO: This method is getting long.
  def update(branches)
    ApplicationUtils.acquiring_lock_file('updating') do
      started_at = Time.now
      ncommits   = 0

      git_fetch
      pulled_at = Time.now

      if names_mapping_updated = names_mapping_updated?
        logger.info("there's a new names mapping")
      else
        logger.info("same names mapping than in last repo update")
      end

      Commit.transaction do
        ncommits = import_new_commits(branches)
        logger.info("#{ncommits} new commits imported into the database")

        break if ncommits.zero? && !names_mapping_updated

        only_for_new_commits = !names_mapping_updated
        contributor_names_per_commit = compute_contributor_names_per_commit(only_for_new_commits)
        manage_gone_contributors(contributor_names_per_commit.values.flatten.uniq) if names_mapping_updated

        logger.info("updating database")
        assign_contributors(contributor_names_per_commit)
        update_ranks
      end

      if cache_needs_expiration?(ncommits, names_mapping_updated)
        logger.info("expiring cache")
        expire_caches
      else
        logger.info("current cache is valid")
      end

      ended_at = Time.now

      logger.info("update completed in %.1f seconds" % [ended_at - started_at])
      RepoUpdate.create(
        :ncommits   => ncommits,
        :started_at => started_at,
        :pulled_at  => pulled_at,
        :ended_at   => ended_at
      )
    end
  end

protected

  # Determines whether the names mapping has been updated. This is useful because
  # if the names mapping is up to date we only need to assign contributors for
  # new commits.
  def names_mapping_updated?
    lastru = RepoUpdate.last
    # Use started_at in case a revised names manager is deployed while an update
    # is running.
    lastru ? NamesManager.mapping_updated_since?(lastru.started_at) : true
  end

  # Simple-minded git system caller, enough for what we need. Returns the output.
  def git_exec(command, *args)
    Dir.chdir(@grit_repo.working_dir) do
      %x{git #{command} #{args.join(' ')}}
    end
  end

  # Imports those commits in the Git repo that do not yet exist in the database.
  # To do that this method goes from HEAD downwards. New commits are imported
  # into the database, and as soon as a known commit comes up we are done.
  #
  # Note that commits are inserted in reverse order (most recent has lower ID)
  # and that order is not linear as new imports are performed, only relative to
  # commits within a given import.
  def import_new_commits(branches)
    ncommits = 0
    branches.each do |branch|
      ncommits += import_new_commits_in_branch(branch)
    end
    ncommits
  end

  def import_new_commits_in_branch(branch)
    batch_size = 50
    ncommits   = 0
    offset     = 0
    one_year   = 1.year.ago

    logger.info("importing new commits from branch #{branch}")
    loop do
      commits = @grit_repo.commits(branch, batch_size, offset)
      return ncommits if commits.empty?
      commits.each do |commit|
        if Commit.exists?(:sha1 => commit.id)
          if commit.authored_date < one_year
            # We need to stop at some point, so let's assume that no merge is
            # gonna come with commits older than one year.
            return ncommits
          else
            # A merge can import commits older than existing ones, so just go on.
            next
          end
        end
        import_grit_commit(commit, branch)
        ncommits += 1
      end
      offset += commits.size
    end
  end

  # Creates a new commit from data in the given Grit commit object.
  def import_grit_commit(commit, branch)
    new_commit = Commit.new_from_grit_commit(commit, branch)
    if new_commit.save
      logger.info("imported commit #{new_commit.short_sha1}")
    else
      # This is a fatal error, log it and abort the transaction.
      logger.error("couldn't import commit #{commit.id}")
      logger.error(new_commit.errors.full_messages)
      raise ActiveRecord::Rollback
    end
  end

  # Once the contributors are computed from the current commits, the ones in the
  # contributors table that are gone are destroyed. This happens when a new
  # equivalence is known for some contributor, when a "name" is added to the
  # black list in <tt>NamesManager.looks_like_an_author_name</tt>, etc.
  #
  # Contributions for the related commits will in general need to be updated,
  # we just clear them to ease this part, since diffing them by hand has some
  # cases to take into account and it is not worth the effort.
  def manage_gone_contributors(current_contributor_names)
    previous_contributor_names = NamesManager.all_names
    gone_names = previous_contributor_names - current_contributor_names
    unless gone_names.empty?
      reassign_contributors_to = destroy_gone_contributors(gone_names)
      reassign_contributors_to.each {|commit| commit.contributions.clear}
    end
  end

  # Destroys all contributors in +gone_names+ and returns their commits.
  def destroy_gone_contributors(gone_names)
    gone_contributors = Contributor.all(:conditions => ["name IN (?)", gone_names])
    commits_of_gone_contributors = gone_contributors.map(&:commits).flatten.uniq
    gone_contributors.each(&:destroy)
    commits_of_gone_contributors
  end

  # Goes over all or new commits in the database and builds a hash that maps
  # each sha1 to the array of the canonical names of their contributors.
  #
  # This computation ignores the current contributions table altogether, it
  # only takes into account the current mapping rules for name resolution.
  def compute_contributor_names_per_commit(only_for_new_commits)
    contributor_names_per_commit = Hash.new {|h, sha1| h[sha1] = []}
    target = only_for_new_commits ? Commit.with_no_contributors : Commit
    target.find_each do |commit|
      commit.extract_contributor_names(self).each do |contributor_name|
        contributor_names_per_commit[commit.sha1] << contributor_name
      end
    end
    contributor_names_per_commit
  end

  # Iterates over all commits with no contributors and assigns to them the ones
  # in the previously computed <tt>contributor_names_per_commit</tt>.
  def assign_contributors(contributor_names_per_commit)
    # Cache contributors to speed up processing wiped databases. They are about
    # 1400 so we can afford this hash.
    contributors = Hash.new {|h, name| h[name] = Contributor.find_or_create_by_name(name)}

    Commit.with_no_contributors.find_each do |commit|
      # It turns out the constraints in the named scope are inherited
      # in this block via find_each. We introduce an exclusive scope to be
      # sure the exists? test down the shouldnt_count_as_a_contribution? call
      # runs in isolation.
      Commit.send(:with_exclusive_scope) do
        next if commit.shouldnt_count_as_a_contribution?
        contributor_names_per_commit[commit.sha1].each do |contributor_name|
          contributors[contributor_name].commits << commit
        end
      end
    end
  end

  # Once all tables have been updated we compute the rank of each contributor.
  def update_ranks
    i    = 0
    rank = 0
    ncon = nil
    Contributor.all_with_ncontributions.each do |contributor|
      i += 1
      if contributor.ncontributions != ncon
        rank = i
        ncon = contributor.ncontributions
      end
      contributor.update_attribute(:rank, rank) if contributor.rank != rank
    end
  end

  def expire_caches
    FileUtils.rm_rf(File.join(Rails.root, 'tmp', 'cache', 'views'))
  end

  def database_needs_update?(ncommits, gone_names)
    ncommits > 0 || !gone_names.empty?
  end

  def cache_needs_expiration?(ncommits, names_mapping_updated)
    ncommits > 0 || names_mapping_updated || new_day?
  end

  def new_day?
    RepoUpdate.last.ended_at < Time.now.beginning_of_day
  end
end
