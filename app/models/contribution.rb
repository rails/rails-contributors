class Contribution < ActiveRecord::Base
  belongs_to :contributor
  belongs_to :commit

  validates :contributor_id, :presence => true
  validates :commit_id, :presence => true
end
