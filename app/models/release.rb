class Release < ApplicationRecord
  include Comparable

  has_many :commits, :dependent => :nullify
  has_many :contributors, :through => :commits

  scope :sorted, -> {
    order('releases.major DESC, releases.minor DESC, releases.tiny DESC, releases.patch DESC')
  }

  validates :tag, presence: true, uniqueness: true

  # Computes the commits of every release, imports any of them missing, and
  # associates them.
  def self.process_commits(repo, new_releases)
    new_releases.sort.each do |release|
      release.process_commits(repo)
    end
  end

  # Imports a rugged object that was returned as a reference to a tag.
  #
  # Some tags are full objects (annotated tags), and other tags are kinda
  # symlinks to commits (lightweight tags). The method understands both.
  def self.import!(tag, rugged_object)
    case rugged_object
    when Rugged::Tag
      date   = rugged_object.tagger[:time]
      target = rugged_object.target
    when Rugged::Commit
      date   = rugged_object.author[:time]
      target = rugged_object
    end

    # Some tags, like v1.2.0, do not have their target imported. Ensure the
    # target of a tag is in the database.
    unless commit = Commit.find_by_sha1(target.oid)
      commit = Commit.import!(target)
    end
    Release.create!(tag: tag, date: date)
  end

  # Releases are ordered by their version, numerically. Note this is not
  # chronological, since it is customary that stable branches have maintenance
  # releases in parallel.
  def <=>(other)
    (major <=> other.major).nonzero? ||
    (minor <=> other.minor).nonzero? ||
    (tiny  <=> other.tiny).nonzero?  ||
    (patch <=> other.patch).nonzero? ||
    0
  end

  # Writes the tag and sets major, minor, tiny, and patch from the new value.
  def tag=(str)
    write_attribute(:tag, str)
    split_version
  end

  # Sets the date, correcting it for releases whose Git date we know is wrong.
  def date=(date)
    date = actual_date_for_release(date)
    write_attribute(:date, date)
  end

  # The name of a release is the tag name except for the leading "v".
  def name
    tag[1..-1]
  end

  # Returns the name with dots converted to hyphens.
  def to_param
    name.tr('.', '-')
  end

  # Encapsulates what needs to be queried given a param.
  def self.find_by_param(param)
    find_by_tag('v' + param.tr('-', '.'))
  end

  # Computes the commits in this release, imports any of them missing, and
  # associates them.
  def process_commits(repo)
    released_sha1s = repo.rev_list(prev.try(:tag), tag)

    released_sha1s.each_slice(1024) do |sha1s|
      import_missing_commits(repo, sha1s)
      associate_commits(sha1s)
    end
  end

  # About a thousand of commits from the Subversion times are not reachable
  # from branch tips, which is what the main importer walks back. When a
  # release is detected we make sure the commits reported by rev-list are
  # present in the database.
  def import_missing_commits(repo, released_sha1s)
    existing_sha1s = Commit.where(sha1: released_sha1s).pluck(:sha1)
    (released_sha1s - existing_sha1s).each do |sha1|
      logger.debug("importing #{sha1} for #{tag}")
      Commit.import!(repo.repo.lookup(sha1))
    end
  end

  # Associate the given SHA1s to this release, assuming they exist in the
  # commits table.
  def associate_commits(sha1s)
    # We force release_id to be NULL because rev-list in svn yields some
    # repeated commits in several releases.
    Commit.where(sha1: sha1s, release_id: nil).update_all(release_id: id)
  end

  # Computes the previous release as of today from the database. The previous
  # release may change with time. For example, the previous release of 3.2.0
  # may be 3.1.5 one day, and 3.1.6 if it gets later released.
  def prev
    Release.where(<<-SQL).sorted.first
      (major = #{major} AND minor = #{minor} AND tiny = #{tiny} AND patch < #{patch}) OR
      (major = #{major} AND minor = #{minor} AND tiny < #{tiny}) OR
      (major = #{major} AND minor < #{minor}) OR
      (major < #{major})
    SQL
  end

  # Returns all releases, ordered by version, with virtual attributes ncommits
  # and ncontributors.
  def self.all_with_ncommits_and_ncontributors
    # Outer joins, because 2.0.1 according to git rev-list v2.0.0..v2.0.1 was a
    # release with no commits.
    select(<<-SELECT).joins(<<-JOINS).group('releases.id').sorted.to_a
      releases.*,
      COUNT(DISTINCT(commits.id))                   AS ncommits,
      COUNT(DISTINCT(contributions.contributor_id)) AS ncontributors
    SELECT
      LEFT OUTER JOIN commits       ON commits.release_id = releases.id
      LEFT OUTER JOIN contributions ON commits.id = contributions.commit_id
    JOINS
  end

  # Returns the URL of this commit in GitHub.
  def github_url
    "https://github.com/rails/rails/tree/#{tag}"
  end

  private

  def split_version
    numbers = name.split('.')

    self.major = numbers[0].to_i
    self.minor = numbers[1].to_i
    self.tiny  = numbers[2].to_i
    self.patch = numbers[3].to_i
  end

  # Releases coming from Subversion were tagged in 2008 when the repo was
  # imported into git. I have scrapped
  #
  #   http://rubyforge.org/frs/?group_id=307
  #
  # to generate this case statement.
  def actual_date_for_release(date)
    case tag
    when 'v0.5.0'
      DateTime.new(2004, 7, 24)
    when 'v0.5.5'
      DateTime.new(2004, 7, 28)
    when 'v0.5.6'
      DateTime.new(2004, 7, 29)
    when 'v0.5.7'
      DateTime.new(2004, 8, 1)
    when 'v0.6.0'
      DateTime.new(2004, 8, 6)
    when 'v0.6.5'
      DateTime.new(2004, 8, 20)
    when 'v0.7.0'
      DateTime.new(2004, 9, 5)
    when 'v0.8.0'
      DateTime.new(2004, 10, 25)
    when 'v0.8.5'
      DateTime.new(2004, 11, 17)
    when 'v0.9.0'
      DateTime.new(2004, 12, 16)
    when 'v0.9.1'
      DateTime.new(2004, 12, 17)
    when 'v0.9.2'
      DateTime.new(2004, 12, 23)
    when 'v0.9.3'
      DateTime.new(2005, 1, 4)
    when 'v0.9.4'
      DateTime.new(2005, 1, 17)
    when 'v0.9.4.1'
      DateTime.new(2005, 1, 18)
    when 'v0.9.5'
      DateTime.new(2005, 1, 25)
    when 'v0.10.0'
      DateTime.new(2005, 2, 24)
    when 'v0.10.1'
      DateTime.new(2005, 3, 7)
    when 'v0.11.0'
      DateTime.new(2005, 3, 22)
    when 'v0.11.1'
      DateTime.new(2005, 3, 27)
    when 'v0.12.0'
      DateTime.new(2005, 4, 19)
    when 'v0.12.1'
      DateTime.new(2005, 4, 19)
    when 'v0.13.0'
      DateTime.new(2005, 7, 6)
    when 'v0.13.1'
      DateTime.new(2005, 7, 11)
    when 'v0.14.1'
      DateTime.new(2005, 10, 19)
    when 'v0.14.2'
      DateTime.new(2005, 10, 26)
    when 'v0.14.3'
      DateTime.new(2005, 11, 7)
    when 'v0.14.4'
      DateTime.new(2005, 12, 8)
    when 'v1.0.0'
      DateTime.new(2005, 12, 13)
    when 'v1.1.0'
      DateTime.new(2006, 3, 28)
    when 'v1.1.1'
      DateTime.new(2006, 4, 6)
    when 'v1.1.2'
      DateTime.new(2006, 4, 9)
    when 'v1.1.3'
      DateTime.new(2006, 6, 27)
    when 'v1.1.4'
      DateTime.new(2006, 6, 29)
    when 'v1.1.5'
      DateTime.new(2006, 8, 8)
    when 'v1.1.6'
      DateTime.new(2006, 8, 10)
    when 'v1.2.0'
      DateTime.new(2007, 1, 18)
    when 'v1.2.1'
      DateTime.new(2007, 1, 18)
    when 'v1.2.2'
      DateTime.new(2007, 2, 6)
    when 'v1.2.3'
      DateTime.new(2007, 3, 13)
    when 'v1.2.4'
      DateTime.new(2007, 10, 4)
    when 'v1.2.5'
      DateTime.new(2007, 10, 12)
    when 'v1.2.6'
      DateTime.new(2007, 11, 24)
    when 'v2.0.0'
      DateTime.new(2007, 12, 6)
    when 'v2.0.1'
      DateTime.new(2007, 12, 7)
    when 'v2.0.2'
      DateTime.new(2007, 12, 16)
    when 'v2.0.4'
      DateTime.new(2008, 9, 4)
    when 'v2.1.0'
      DateTime.new(2008, 5, 31)
    else
      date
    end
  end
end
