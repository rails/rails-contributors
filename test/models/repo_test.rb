require 'test_helper'

class RepoTest < ActiveSupport::TestCase
  def test_sync_ranks
    Repo.new.send(:sync_ranks)

    {jeremy: 1, david: 2, jose: 3, xavier: 3, vijay: 3}.each do |c, r|
      assert_equal r, contributors(c).rank
    end
  end

  def test_sync_first_contributed_timestamps
    Contributor.update_all(first_contribution_at: nil)
    Repo.new.send(:sync_first_contribution_timestamps)

    assert_first_contribution :commit_e0ef631, :david
    assert_first_contribution :commit_5b90635, :jeremy
    assert_first_contribution :commit_5b90635, :jose
    assert_first_contribution :commit_26c024e, :xavier
    assert_first_contribution :commit_6c65676, :vijay
  end

  def assert_first_contribution(commit, contributor)
    expected = commits(commit).committer_date
    actual   = contributors(contributor).first_contribution_at

    assert_equal expected, actual
  end
end
