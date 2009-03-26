require 'set'

class Repo
  attr_reader :logger

  # This is the entry point to update the database from a recent pull.
  def self.update(path)
    new(path).update
  end

  def initialize(path)
    @logger = Rails.logger
    @repo   = Grit::Repo.new(path)
  end

  def git_pull
    git_exec('pull')
  end

  def git_show(object_id)
    git_exec('show', object_id)
  end

  def update
    ApplicationUtils.acquiring_sync_file('pulling') do
      start_at = Time.now
      #git_pull
      Commit.transaction do
        import_new_commits_into_the_database

        current_contributor_names, contributor_names_per_commit = compute_current_contributions
        update_contributors(current_contributor_names)
        assign_contributors(contributor_names_per_commit)
        # TODO: Expire main listing.
      end
      end_at = Time.now
      logger.info("update completed in %.1f seconds" % [end_at - start_at])
    end
  end

protected

  # Simple-minded git system caller, enough for what we need. Returns the output.
  def git_exec(command, *args)
    git_call = "git --git-dir='#{@repo.path}' #{command} #{args.join(' ')}"
    logger.info(git_call)
    %x{#{git_call}}
  end

  # Imports those commits in the Git repo that do not yet exist in the database.
  # To do that this method goes from HEAD downwards. New commits are imported
  # into the database, and as soon as a known commit comes up we are done.
  #
  # Note that commits are inserted in reverse order (most recent has lower ID)
  # and that order is not linear as new imports are performed, only relative to
  # commits within a given import.
  def import_new_commits_into_the_database
    batch_size = 100
    offset = 0
    loop do
      commits = @repo.commits('master', batch_size, offset)
      return if commits.empty?
      commits.each do |commit|
        return if Commit.exists?(:object_id => commit.id)
        import_grit_commit(commit)
      end
      offset += commits.size
    end
  end

  # Creates a new commit from data in the given Grit commit object.
  def import_grit_commit(commit)
    new_commit = Commit.new_from_grit_commit(commit)
    if new_commit.save
      logger.info("imported commit #{new_commit.short_hash}")
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
  def update_contributors(current_contributor_names)
    previous_contributor_names = Set.new(Contributor.connection.select_values("SELECT NAME FROM CONTRIBUTORS"))
    gone_names = previous_contributor_names - current_contributor_names
    reassign_contributors_to = destroy_gone_contributors(gone_names)
    reassign_contributors_to.each {|commit| commit.contributions.clear}
  end

  # Destroys all contributors in +gone_names+ and returns their commits.
  def destroy_gone_contributors(gone_names)
    gone_contributors = Contributor.all(:conditions => ["NAME IN (?)", gone_names])
    commits_of_gone_contributors = gone_contributors.map(&:commits).flatten.uniq
    gone_contributors.each(&:destroy)
    commits_of_gone_contributors
  end

  # Goes over all the commits in the database and builds a hash that maps
  # canonical names to the commits they are contributors of.
  #
  # This computation ignores the current contributions table altogether, it
  # only takes into account the current commits and the current mapping for
  # names.
  def compute_current_contributions
    contributor_names_per_commit = Hash.new {|h, commit| h[commit] = []}
    current_contributor_names    = Set.new
    Commit.find_each do |commit|
      commit.extract_contributor_names(self).each do |contributor_name|
        current_contributor_names << contributor_name
        contributor_names_per_commit[commit.object_id] << contributor_name
      end
    end
    return current_contributor_names, contributor_names_per_commit
  end

  # Iterates over all commits with no contributors and assigns to them the ones
  # in the previously computed <tt>@contributor_names_per_commit</tt>.
  def assign_contributors(contributor_names_per_commit)
    Commit.with_no_contributors.find_each do |commit|
      contributor_names_per_commit[commit.object_id].each do |contributor_name|
        contributor = Contributor.find_or_create_by_name(contributor_name)
        contributor.commits << commit
      end
    end
  end
end
