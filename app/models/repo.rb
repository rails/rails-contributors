require 'application_utils'

class Repo
  attr_reader :logger, :path, :heads, :tags, :repo

  # Clone with --mirror:
  #
  #   git clone --mirror git://github.com/rails/rails.git
  #
  PATH  = "#{Rails.root}/rails.git"
  HEADS = %r{\Arefs/heads/(?:master|.*-stable)\z}
  TAGS  = %r{\Arefs/tags/v[\d.]+\z}

  # This is the entry point to sync the database from cron jobs etc:
  #
  #   bundle exec rails runner Repo.sync
  #
  # is the intended usage. This fetches new stuff, imports new commits if any,
  # imports new releases if any, assigns contributors and updates ranks.
  #
  # If the names manager has been updated since the previous execution special
  # code detects names that are gone and recomputes the contributors for their
  # commits.
  def self.sync(path=PATH, heads=HEADS, tags=TAGS)
    new(path, heads, tags).sync
  end

  def initialize(path=PATH, heads=HEADS, tags=TAGS)
    @logger = Rails.logger
    @path   = path
    @heads  = heads
    @tags   = tags
    @repo   = Rugged::Repository.new(path)
  end

  # Executes a git command, optionally capturing its output.
  #
  # If the execution is not successful +StandardError+ is raised.
  def git(args, capture=false)
    cmd = "git #{args}"
    logger.info(cmd)
    Dir.chdir(path) do
      if capture
        out = `#{cmd}`
        return out if $?.success?
        raise "git error: #{$?}"
      else
        system(cmd) or raise "git error: #{$?}"
      end
    end
  end

  # Issues a git fetch.
  def fetch
    git 'fetch --quiet --prune'
  end

  # Returns the patch of the given commit.
  def diff(sha1)
    git "diff --no-color #{sha1}^!", true
  end

  # Returns the commits between +from+ and +to+. That is, that a reachable from
  # +to+, but not from +from+.
  #
  # We use this method to determine which commits belong to a release.
  def rev_list(from, to)
    arg = from ? "#{from}..#{to}" : to
    lines = git "rev-list #{arg}", true
    lines.split("\n")
  end

  # This method does the actual work behind Repo.sync.
  def sync
    ApplicationUtils.acquiring_lock_file('updating') do
      started_at = Time.current

      fetch

      ActiveRecord::Base.transaction do
        ncommits  = sync_commits
        nreleases = sync_releases

        nmupdated = names_mapping_updated?
        if ncommits > 0 || nreleases > 0 || nmupdated
          sync_names(nmupdated)
          sync_ranks
        end

        RepoUpdate.create!(
          ncommits:   ncommits,
          nreleases:  nreleases,
          started_at: started_at,
          ended_at:   Time.current,
          nmupdated:  nmupdated
        )

        ApplicationUtils.expire_cache if cache_needs_expiration?(ncommits, nreleases, nmupdated)
      end
    end
  end

  protected

  def refs(regexp)
    repo.refs.select do |ref|
      ref.name =~ regexp
    end
  end

  # Imports those commits in the Git repo that do not yet exist in the database
  # by walking the master and stable branches backwards starting at the tips
  # and following parents.
  def sync_commits
    ncommits = 0

    ActiveRecord::Base.logger.silence do
      refs(heads).each do |ref|
        to_visit = [repo.lookup(ref.target.oid)]
        while commit = to_visit.shift
          unless Commit.exists?(sha1: commit.oid)
            ncommits += 1
            Commit.import!(commit)
            to_visit.concat(commit.parents)
          end
        end
      end
    end

    ncommits
  end

  # Imports new releases, if any, determines which commits belong to them, and
  # associates them. By definition, a release corresponds to a stable tag, one
  # that matches <tt>\Av[\d.]+\z</tt>.
  def sync_releases
    new_releases = []

    refs(tags).each do |ref|
      tag = ref.name[%r{[^/]+\z}]
      unless Release.exists?(tag: tag)
        target = ref.target
        commit = target.is_a?(Rugged::Commit) ? target : target.target
        new_releases << Release.import!(tag, commit)
      end
    end

    Release.process_commits(self, new_releases)

    new_releases.size
  end

  # Computes the name of the contributors and adjusts associations and the
  # names table. If some names are gone due to new mappings collapsing two
  # names into one, for example, the credit for commits of gone names is
  # revised, resulting in the canonical name being associated.
  def sync_names(nmupdated)
    Contribution.delete_all if nmupdated
    assign_contributors
    Contributor.with_no_commits.delete_all if nmupdated
  end

  # Once all tables have been updated we compute the rank of each contributor.
  def sync_ranks
    i               = 0
    prev_ncommits   = nil
    new_rank        = 0
    ranks_to_update = Hash.new {|h, k| h[k] = []}

    # Compute new ranks, and store those which need to be updated.
    Contributor.all_with_ncommits.each do |contributor|
      i += 1

      if contributor.ncommits != prev_ncommits
        new_rank = i
        prev_ncommits = contributor.ncommits
      end

      if contributor.rank != new_rank
        ranks_to_update[new_rank] << contributor.id
      end
    end

    # Update new ranks, if any.
    ranks_to_update.each do |rank, contributor_ids|
      Contributor.where(id: contributor_ids).update_all("rank = #{rank}")
    end
  end

  # Determines whether the names mapping has been updated. This is useful because
  # if the names mapping is up to date we only need to assign contributors for
  # new commits.
  def names_mapping_updated?
    @nmu ||= begin
      lastru = RepoUpdate.last
      # Use started_at in case a revised names manager is deployed while an update
      # is running.
      lastru ? NamesManager.mapping_updated_since?(lastru.started_at) : true
    end
  end

  # Goes over all or new commits in the database and builds a hash that maps
  # each sha1 to the array of the canonical names of their contributors.
  #
  # This computation ignores the current contributions table altogether, it
  # only takes into account the current mapping rules for name resolution.
  def compute_contributor_names_per_commit
    Hash.new {|h, sha1| h[sha1] = []}.tap do |contributor_names_per_commit|
      Commit.with_no_contributors.find_each do |commit|
        commit.extract_contributor_names(self).each do |contributor_name|
          contributor_names_per_commit[commit.sha1] << contributor_name
        end
      end
    end
  end

  # Iterates over all commits with no contributors and assigns to them the ones
  # in the previously computed <tt>contributor_names_per_commit</tt>.
  def assign_contributors
    contributor_names_per_commit = compute_contributor_names_per_commit
    contributors = Hash.new {|h, name| h[name] = Contributor.find_or_create_by(name: name)}
    Commit.with_no_contributors.find_each do |commit|
      contributor_names_per_commit[commit.sha1].each do |contributor_name|
        contributors[contributor_name].commits << commit
      end
    end
  end

  # Do we need to expire the cached pages?
  def cache_needs_expiration?(ncommits, nreleases, nmupdated)
    ncommits > 0 || nreleases > 0 || nmupdated
  end
end
