class Contributor < ActiveRecord::Base
  has_many :contributions, :dependent => :destroy
  has_many :commits, :through => :contributions

  validates_presence_of   :url_id
  validates_uniqueness_of :url_id

  before_save :set_url_id

  # The contributors table may change if new name equivalences are added and IDs
  # in particular are expected to move. So, we just put the parameterized name
  # in URLs, which is unique anyway.
  def to_param
    url_id
  end


private
  def set_url_id
    self.url_id = name.parameterize
  end
end
