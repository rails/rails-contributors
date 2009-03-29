class Contribution < ActiveRecord::Base
  belongs_to :contributor
  belongs_to :commit

  validates_presence_of :contributor_id
  validates_presence_of :commit_id
end
