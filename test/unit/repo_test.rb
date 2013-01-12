require 'test_helper'

class RepoTest < ActiveSupport::TestCase
  def test_sync_ranks
    Repo.new.send(:sync_ranks)

    {jeremy: 1, david: 1, jose: 3, xavier: 3, vijay: 3}.each do |c, r|
      assert_equal r, contributors(c).rank
    end
  end
end