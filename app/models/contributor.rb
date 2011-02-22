class Contributor < ActiveRecord::Base
  has_many :contributions, :dependent => :destroy
  has_many :commits, :through => :contributions

  validates_presence_of   :url_id
  validates_uniqueness_of :url_id

  def self.all_with_ncontributions
    all_with_ncontributions_since(nil)
  end

  def self.all_with_ncontributions_since(date)
    conditions = date ? ['commits.committed_timestamp > ?', date] : nil
    select('contributors.*, COUNT(contributions.commit_id) as ncontributions').
      joins(<<-JOINS).
        INNER JOIN contributions ON contributors.id = contributions.contributor_id
        INNER JOIN commits       ON commits.id = contributions.commit_id
      JOINS
      where(conditions).
      group('contributions.contributor_id').
      order('ncontributions DESC, url_id ASC').
      all
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
