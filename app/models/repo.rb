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

  def git(args, capture=false)
    cmd = "git #{args}"
    puts cmd
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

  def fetch
    git 'fetch --quiet --prune'
  end

  def diff(sha1)
    git "diff --no-color #{sha1}^!", true
  end

  def rev_list(from, to)
    arg = from ? "#{from}..#{to}" : to
    lines = git "rev-list #{arg}", true
    lines.split("\n")
  end

  def sync
    ApplicationUtils.acquiring_lock_file('updating') do
      started_at = Time.current

      fetch

      ActiveRecord::Base.transaction do
        ncommits  = sync_commits
        nreleases = sync_releases

        if ncommits > 0 || nreleases > 0 || names_mapping_updated?
          sync_names
          sync_ranks
        end

        RepoUpdate.create!(
          ncommits:   ncommits,
          nreleases:  nreleases,
          started_at: started_at,
          ended_at:   Time.current
        )

        expire_caches if cache_needs_expiration?(ncommits, names_mapping_updated?)
      end
    end
  end

  protected

  # Imports those commits in the Git repo that do not yet exist in the database
  # by walking the master and stable branches backwards starting at the tips
  # and following parents.
  def sync_commits
    ncommits = 0

    ActiveRecord::Base.logger.silence do
      repo.refs(heads).each do |ref|
        to_visit = [repo.lookup(ref.target)]
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

  def sync_releases
    new_releases = []

    repo.refs(tags).each do |ref|
      tag = ref.name[%r{[^/]+\z}]
      unless Release.exists?(tag: tag)
        new_releases << Release.import!(tag, repo.lookup(ref.target))
      end
    end

    Release.process_commits(self, new_releases)

    new_releases.size
  end

  def sync_names
    contributor_names_per_commit = compute_contributor_names_per_commit(names_mapping_updated?)
    manage_gone_contributors(contributor_names_per_commit.values.flatten.uniq) if names_mapping_updated?
    assign_contributors(contributor_names_per_commit)
  end

  # Once all tables have been updated we compute the rank of each contributor.
  def sync_ranks
    i    = 0
    rank = 0
    ncon = nil

    Contributor.all_with_ncontributions.each do |contributor|
      i += 1
      if contributor.ncontributions != ncon
        rank = i
        ncon = contributor.ncontributions
      end
      contributor.update_column(:rank, rank) if contributor.rank != rank
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
  def compute_contributor_names_per_commit(for_all_commits)
    contributor_names_per_commit = Hash.new {|h, sha1| h[sha1] = []}
    target = for_all_commits ? Commit : Commit.with_no_contributors
    target.find_each do |commit|
      commit.extract_contributor_names(self).each do |contributor_name|
        contributor_names_per_commit[commit.sha1] << contributor_name
      end
    end
    contributor_names_per_commit
  end

  # Once the contributors are computed from the current commits, the ones in the
  # contributors table that are gone are destroyed. This happens when a new
  # equivalence is known for some contributor, when a "name" is added to the
  # black list in <tt>NamesManager.looks_like_an_author_name</tt>, etc.
  def manage_gone_contributors(current_contributor_names)
    previous_contributor_names = NamesManager.all_names
    gone_names = previous_contributor_names - current_contributor_names
    destroy_gone_contributors(gone_names) unless gone_names.empty?
  end

  # Destroys all contributors in +gone_names+ and clears their commits.
  # Since commits may have more contributors we are just going to
  # remove them all to later reassign.
  def destroy_gone_contributors(gone_names)
    gone_contributors = Contributor.where(name: gone_names)
    gone_contributors.each do |contributor|
      contributor.commits.each do |commit|
        commit.contributions.clear
      end
      contributor.destroy
    end
  end

  # Iterates over all commits with no contributors and assigns to them the ones
  # in the previously computed <tt>contributor_names_per_commit</tt>.
  def assign_contributors(contributor_names_per_commit)
    # Cache contributors to speed up processing wiped databases. They are about
    # 1400 so we can afford this hash.
    contributors = Hash.new {|h, name| h[name] = Contributor.find_or_create_by_name(name)}

    Commit.with_no_contributors.find_each do |commit|
      contributor_names_per_commit[commit.sha1].each do |contributor_name|
        contributors[contributor_name].commits << commit
      end
    end
  end

  # Expires the cache under tmp/cache.
  #
  # We do that in two steps: first we move tmp/cache into a new directory,
  # and then we remove that one. It is done that way because if we rm -rf
  # tmp/cache directly and at the same time requests come and create new
  # cache files a black hole can be created and handling that is beyond
  # the legendary robustness of this website.
  #
  # On the other hand, moving is atomic. Atomic is good.
  def expire_caches
    Dir.chdir("#{Rails.root}/tmp") do
      if File.exists?('cache')
        expired_cache = "expired_cache.#{Time.now.to_f}"
        FileUtils.mv('cache', expired_cache, force: true)
        FileUtils.rm_rf(expired_cache)
      end
    end
  end

  def database_needs_update?(ncommits, gone_names)
    ncommits > 0 || !gone_names.empty?
  end

  def cache_needs_expiration?(ncommits, names_mapping_updated)
    ncommits > 0 || names_mapping_updated || new_day?
  end

  def new_day?
    RepoUpdate.last.ended_at < Time.current.beginning_of_day
  end
end
