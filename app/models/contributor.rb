class Contributor < ActiveRecord::Base
  has_many :contributions, :dependent => :destroy
  has_many :commits, :through => :contributions

  validates :name,   :presence => true, :uniqueness => true
  validates :url_id, :presence => true, :uniqueness => true

  nfc :name

  scope :with_no_commits, -> {
    joins('LEFT OUTER JOIN contributions ON contributors.id = contributions.contributor_id').
    where('contributions.commit_id' => nil)
  }

  def self.all_with_ncommits
    _all_with_ncommits(:contributions)
  end

  def self.all_with_ncommits_by_time_window(since, upto)
    if since && upto
      _all_with_ncommits(:commits, ['commits.committer_date BETWEEN ? AND ?', since, upto])
    elsif since
      _all_with_ncommits(:commits, ['commits.committer_date >= ?', since])
    else
      all_with_ncommits
    end
  end

  def self.all_with_ncommits_by_release(release)
    _all_with_ncommits(:commits, 'commits.release_id' => release.id)
  end

  def self.all_with_ncommits_in_edge
    _all_with_ncommits(:commits, 'commits.release_id' => nil)
  end

  def self._all_with_ncommits(joins, where=nil)
    select('contributors.*, COUNT(*) AS ncommits').
      joins(joins).
      where(where).
      group('contributors.id').
      order('ncommits DESC, contributors.url_id ASC')
  end

  # The contributors table may change if new name equivalences are added and IDs
  # in particular are expected to move. So, we just put the parameterized name
  # in URLs, which is unique anyway.
  def to_param
    url_id
  end

  def self.find_by_param(param)
    find_by_url_id(param)
  end

  def name=(name)
    super
    set_url_id
  end

private

  def set_url_id
    self.url_id = name.parameterize
  end
end
