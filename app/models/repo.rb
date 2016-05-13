require 'application_utils'

class Repo
  attr_reader :logger, :path, :heads, :tags, :repo, :rebuild_all

  # Clone with --mirror:
  #
  #   git clone --mirror git://github.com/rails/rails.git
  #
  PATH  = "#{Rails.root}/rails.git"
  HEADS = %r{\Arefs/heads/(master|[\d\-]+(-stable)?)\z}
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
  # commits. This can be forced by passing rebuild_all: true.
  def self.sync(path: PATH, heads: HEADS, tags: TAGS, rebuild_all: false)
    new(path: path, heads: heads, tags: tags, rebuild_all: rebuild_all).sync
  end

  def initialize(path: PATH, heads: HEADS, tags: TAGS, rebuild_all: false)
    @logger      = Rails.logger
    @path        = path
    @heads       = heads
    @tags        = tags
    @rebuild_all = rebuild_all || names_mapping_updated?
    @repo        = Rugged::Repository.new(path)
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

        if ncommits > 0 || nreleases > 0 || rebuild_all
          sync_names
          sync_ranks
          sync_first_contribution_timestamps
        end

        RepoUpdate.create!(
          ncommits:    ncommits,
          nreleases:   nreleases,
          started_at:  started_at,
          ended_at:    Time.current,
          rebuild_all: rebuild_all
        )

        ApplicationUtils.expire_cache if cache_needs_expiration?(ncommits, nreleases)
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
  def sync_names
    Contribution.delete_all if rebuild_all
    assign_contributors
    Contributor.with_no_commits.delete_all if rebuild_all
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

  def sync_first_contribution_timestamps
    Contributor.set_first_contribution_timestamps(!rebuild_all)
  end

  # Determines whether the names mapping has been updated. This is useful because
  # if the names mapping is up to date we only need to assign contributors for
  # new commits.
  def names_mapping_updated?
    @nmu ||= begin
      lastru = RepoUpdate.last
      # Use started_at in case a revised names manager is deployed while an update
      # is running.
      lastru ? NamesManager.updated_since?(lastru.started_at) : true
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

    data = []
    Commit.with_no_contributors.find_each do |commit|
      contributor_names_per_commit[commit.sha1].each do |contributor_name|
        # FIXME: This check is needed because creation in a few exceptional
        # cases fails due to url_id collisions (Geoffrey ROGUELON, Adam), or
        # due blank url_ids (प्रथमेश).
        if contributors[contributor_name].id
          data << "#{contributors[contributor_name].id},#{commit.id}\n"
        end
      end
    end

    conn = ActiveRecord::Base.connection.raw_connection
    conn.copy_data('COPY contributions (contributor_id, commit_id) FROM STDIN CSV') do
      data.each do |row|
        conn.put_copy_data(row)
      end
    end
  end

  # Do we need to expire the cached pages?
  def cache_needs_expiration?(ncommits, nreleases)
    ncommits > 0 || nreleases > 0 || rebuild_all
  end
end
