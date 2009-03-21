require 'set'

class Repo
  attr_reader :logger
  
  PATH = File.join(Rails.root, 'repo')
  URL = 'git://github.com/rails/rails.git'

  # This is the entry point to update the database from a recent pull.
  def self.update
    new.update
  end

private

  def initialize
    @logger = Rails.logger
    clone_repo_if_needed
    @repo = Grit::Repo.new(PATH)
  end

  def clone_repo_if_needed
    return if File.exists?(File.join(PATH, '.git'))
    logger.debug("cloning #{URL}, this may take a while...")
    system("git clone -q #{URL} repo")
    logger.debug("done")
  rescue Exception => e
    logger.error("fatal error while trying to clone the repo: #{e}")
    logger.error("aborting")
    raise
  end

  def update
    Commit.transaction do
      import_new_commits_into_the_database
      update_contributors
      assign_contributors_to_commits_with_none
    end
  end

  # Imports those commits in the Git repo that do not yet exist in the database.
  def import_new_commits_into_the_database
    batch_size = 100
    offset = 0
    loop do
      commits = @repo.commits('master', batch_size, offset)
      break if commits.empty?
      commits.each do |commit|
        if Commit.exists?(:object_id => commit.id)
          # repo.commits returns commits in order, most recent first. Thus, if
          # this commit exists already in the database we are done.
          return
        else
          import_grit_commit(commit)
        end
        offset += 1
      end
    end
  end

  # Creates a new commit from data in the given Grit commit object.
  def import_grit_commit(commit)
    new_commit = Commit.new_from_grit_commit(commit)
    if new_commit.save
      logger.info("imported commit #{new_commit.short_hash}")
    else
      logger.error("couldn't import commit #{commit.id}")
      logger.error(new_commit.errors.full_messages)
      raise ActiveRecord::Rollback
    end
  end

  # Once the contributors are computed from the current commits, the ones in the
  # contributors table that are gone are destroyed. This happens when a new
  # equivalence is known for some contributor, when a "name" is added to the
  # black list in +NamesManager.looks_like_an_author_name+, etc.
  #
  # Contributions for the related commits will in general need to be updated,
  # we just clear them to ease this part, since diffing them by hand has some
  # cases to take into account and it is not worth the effort.
  def update_contributors
    current_contributions = compute_current_contributions
    current_names         = Set.new(current_contributions.keys)
    previous_names        = Set.new(Contributors.all.map(&:name))

    gone_names = previous_names - current_names
    reassign_contributors_to = destroy_gone_contributors(gone_names)
    reassign_contributors_to.each {|commit| commit.contributions.clear}
  end

  # Destroys all contributors in +gone_names+ and returns their commits.
  def destroy_gone_contributors(gone_names)
    gone_contributors = Contributor.all(:conditions => ["NAME IN (?)", gone_names])
    reassign_contributors_to = gone_contributors.map(&:commits).flatten.uniq
    gone_contributors.each(&:destroy)
    reassign_contributors_to
  end

  # Goes over all the commits in the database and builds a hash that maps
  # canonical names to the commits they are contributors of.
  #
  # This computation ignores the current contributions table altogether, it
  # only takes into account the current commits and the current mapping for
  # names.
  def compute_current_contributions
    @contributor_names_per_commit = Hash.new {|h, commit| h[commit] = Array.new}
    @current_contributor_names    = Set.new
    Commit.find_each do |commit|
      commit.extract_contributor_names.each do |contributor_name|
        @contributor_names_per_commit[commit] << contributor_name
        @current_contributor_names << contributor_name
      end
    end
  end

  # Iterates over all commits with no contributors and assigns to them the ones
  # in the previously computed <tt>@contributor_names_per_commit</tt>.
  def assign_contributors_to_commits_with_none
    Commit.with_no_contributors.find_each do |commit|
      @contributor_names_per_commit[commit].each do |contributor_name|
        contributor = Contributor.find_or_create_by_name(contributor_name)
        contributor.commits << commit
      end
    end
  end
end
