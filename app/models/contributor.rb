class Contributor < ActiveRecord::Base
  has_many :contributions, :dependent => :destroy
  has_many :commits, :through => :contributions

  validates :url_id, :presence => true, :uniqueness => true

  def self.all_with_ncontributions
    _all_with_ncontributors(nil, nil)
  end

  def self.all_with_ncontributions_by_release(release)
    _all_with_ncontributors(release, nil)
  end

  def self.all_with_ncontributions_by_date(date)
    _all_with_ncontributors(nil, date)
  end

  def self._all_with_ncontributors(release, date)
    joins = release || date ? :commits : :contributions
    where = release ? {'commits.release_id' => release.id} :
            date    ? ['commits.committer_date > ?', date] : nil

    select('contributors.*, COUNT(contributions.commit_id) AS ncontributions').
      joins(joins).
      where(where).
      group('contributions.contributor_id').
      order('ncontributions DESC, url_id ASC').all
  end

  # The contributors table may change if new name equivalences are added and IDs
  # in particular are expected to move. So, we just put the parameterized name
  # in URLs, which is unique anyway.
  def to_param
    url_id
  end

  def name=(name)
    write_attribute(:name, name)
    set_url_id
  end

private

  def set_url_id
    self.url_id = name.parameterize
  end
end
