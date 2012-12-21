class Release < ActiveRecord::Base
  has_many :commits

  before_create :split_version
  before_create :fix_date

  scope :sorted, -> {
    order('releases.major DESC, releases.minor DESC, releases.tiny DESC, releases.patch DESC')
  }

  def self.process_commits(new_releases)
    new_releases.sort.reverse.each do |release|
      release.process_commits(self)
    end
  end

  def self.import!(tag, rugged_object)
    case rugged_object
    when Rugged::Tag
      # This is an annonated tag.
      date = object.tagger[:time]
      sha1 = object.target_oid
    when Rugged::Commit
      # This is a lightweight tag.
      date = object.author[:time]
      sha1 = object.oid
    end

    Release.create!(tag: tag, commit_sha1: sha1, date: date)
  end

  def <=>(other)
    [major, minor, tiny, patch] <=> [other.major, other.minor, other.tiny, other.patch]
  end

  def name
    tag[1..-1]
  end
  alias to_param name

  def process_commits(repo)
    released_sha1s = repo.rev_list(prev.try(:commit_sha1), commit_sha1)

    released_sha1s.each_slice(1024) do |sha1s|
      import_missing_commits(repo, sha1s)
      associate_commits(sha1s)
    end
  end

  def import_missing_commits(repo, released_sha1s)
    existing_sha1s = Commit.where(sha1: released_sha1s).pluck(:sha1)
    (released_sha1s - existing_sha1s).each do |sha1|
      logger.debug("importing #{sha1} for #{tag}")
      Commit.import!(repo.repo.lookup(sha1))
    end
  end

  def associate_commits(sha1s)
    Commit.update_all({release_id: id}, sha1: sha1s)
  end

  def prev
    Release.where(<<-SQL).sorted.first
      (major = #{major} && minor = #{minor} && tiny = #{tiny} && patch < #{patch}) ||
      (major = #{major} && minor = #{minor} && tiny < #{tiny}) ||
      (major = #{major} && minor < #{minor}) ||
      (major < #{major})
    SQL
  end

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

  private

  def split_version
    numbers = name.split('.')

    self.major = numbers[0].to_i
    self.minor = numbers[1].to_i
    self.tiny  = numbers[2].to_i
    self.patch = numbers[3].to_i
  end

  def fix_date
    self.date = actual_date_for_release
  end

  # Releases coming from Subversion were tagged in 2008 when the repo was
  # imported into git. I have scrapped
  #
  #   http://rubyforge.org/frs/?group_id=307
  #
  # to generate this case statement.
  def actual_date_for_release
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
