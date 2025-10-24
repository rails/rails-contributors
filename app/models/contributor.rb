class Contributor < ApplicationRecord
  has_many :contributions, dependent: :destroy
  has_many :commits, through: :contributions

  validates :name,   presence: true, uniqueness: true
  validates :url_id, presence: true, uniqueness: true

  nfc :name

  scope :with_no_commits, -> {
    left_joins(:contributions).where(contributions: { commit_id: nil })
  }

  def self.all_with_ncommits
    _all_with_ncommits(:contributions)
  end

  def self.all_with_ncommits_by_time_window(since, upto)
    if upto
      _all_with_ncommits(:commits, ['commits.committer_date BETWEEN ? AND ?', since, upto])
    else
      _all_with_ncommits(:commits, ['commits.committer_date >= ?', since])
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

  def self.set_first_contribution_timestamps(only_missing)
    scope = only_missing ? 'first_contribution_at IS NULL' : '1 = 1'

    connection.execute(<<-SQL)
      UPDATE contributors
      SET first_contribution_at = first_contributions.committer_date
      FROM (
        SELECT contributor_id, MIN(commits.committer_date) AS committer_date
          FROM contributions
          INNER JOIN commits ON commits.id = commit_id
          GROUP BY contributor_id
      ) AS first_contributions
      WHERE id = first_contributions.contributor_id
      AND #{scope}
    SQL
  end

  def self.set_last_contribution_timestamps(only_missing)
    scope = only_missing ? 'last_contribution_at IS NULL' : '1 = 1'

    connection.execute(<<-SQL)
      UPDATE contributors
      SET last_contribution_at = last_contributions.committer_date
      FROM (
        SELECT contributor_id, MAX(commits.committer_date) AS committer_date
          FROM contributions
          INNER JOIN commits ON commits.id = commit_id
          GROUP BY contributor_id
      ) AS last_contributions
      WHERE id = last_contributions.contributor_id
      AND #{scope}
    SQL
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
