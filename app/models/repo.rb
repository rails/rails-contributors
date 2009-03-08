class Repo
  attr_reader :path, :logger

  def initialize(path)
    @path   = path
    @logger = Rails.logger
  end

  def self.update(path)
    new(path).update
  end

  def update
    Commit.transaction do
      update_commits
      update_contributions
    end
  end

  private

  # Imports those Rails commits that do not yet exist in the database.
  def update_commits
    repo = Grit::Repo.new(path)
    i = 0
    loop do
      commits = repo.commits('master', 100, i)
      break if commits.empty?
      commits.each do |commit|
        if Commit.exists?(:object_id => commit.id)
          # repo.commits returns commits in order, most recent first. Thus, if
          # this commit exists already in the database we are done.
          return
        else
          import_grit_commit(commit)
        end
        i += 1
      end
    end
  end

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

  def update_contributions
    # TODO
  end
end