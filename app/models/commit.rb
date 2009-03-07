class Commit < ActiveRecord::Base
  has_many :contributions
  has_many :contributors, :through => :contributions

  validates_presence_of   :object_id
  validates_uniqueness_of :object_id  
  validates_inclusion_of  :imported_from_svn, :in => [true, false]

  alias_attribute :hash, :object_id

  # Returns a shortened hash for this commit. Length is 7 by default.
  def short_hash(length=7)
    hash[0, length]
  end

  # Returns the URL of this commit in GitHub.
  def github_url
    "http://github.com/rails/rails/commit/#{hash}"
  end
end
