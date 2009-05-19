require 'set'
require 'fileutils'

class Repo
  attr_reader :logger, :grit_repo

  # This is the entry point to update the database from a recent pull.
  def self.update(path)
    new(path).update
  end

  def initialize(path)
    @logger    = Rails.logger
    @grit_repo = Grit::Repo.new(path)
  end

  def git_pull
    git_exec('pull', '--quiet')
  end

  def git_show(sha1)
    git_exec('show', sha1)
  end

  # TODO: This method is getting long.
  def update
    ApplicationUtils.acquiring_sync_file('updating') do
      started_at = Time.now
      ncommits   = 0

      git_pull
      pulled_at = Time.now

      if names_mapping_updated = names_mapping_updated?
        logger.info("there's a new names mapping")
      else
        logger.info("same names mapping than in last repo update")
      end

      Commit.transaction do
        ncommits = import_new_commits
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
    lastru ? NamesManager.mapping_updated_since?(lastru.ended_at) : true
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
  def import_new_commits
    batch_size = 100
    ncommits   = 0
    offset     = 0
    loop do
      commits = @grit_repo.commits('master', batch_size, offset)
      return ncommits if commits.empty?
      commits.each do |commit|
        return ncommits if Commit.exists?(:sha1 => commit.id)
        import_grit_commit(commit)
        ncommits += 1
      end
      offset += commits.size
    end
  end

  # Creates a new commit from data in the given Grit commit object.
  def import_grit_commit(commit)
    new_commit = Commit.new_from_grit_commit(commit)
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
    gone_contributors = Contributor.all(:conditions => ["NAME IN (?)", gone_names])
    commits_of_gone_contributors = gone_contributors.map(&:commits).flatten.uniq
    gone_contributors.each(&:destroy)
    commits_of_gone_contributors
  end

  # Goes over all or new commits in the database and builds a hash that maps
  # each sha1 to the array of the canonical names of their contributors.
  #
  # This computation ignores the current contributions table altogether, it
  # only takes into account the the current mapping for names.
  def compute_contributor_names_per_commit(only_for_new_commits)
    contributor_names_per_commit = Hash.new {|h, commit| h[commit] = []}
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
    Commit.with_no_contributors.find_each do |commit|
      contributor_names_per_commit[commit.sha1].each do |contributor_name|
        contributor = Contributor.find_or_create_by_name(contributor_name)
        contributor.commits << commit
      end
    end
  end

  # Once all tables have been update we compute the rank of each contributor.
  def update_ranks
    rank = 0
    ncon = nil
    Contributor.all_with_ncontributions.each do |contributor|
      if contributor.ncontributions != ncon
        rank += 1
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
    ncommits > 0 || names_mapping_updated || we_are_switching_time_ranges
  end

  def we_are_switching_time_ranges
    now = Time.now
    last_update_at = RepoUpdate.last.ended_at

    last_update_at < now.beginning_of_week ||
    last_update_at < now.beginning_of_month
    # if we've switched years we've switched months
  end
end
