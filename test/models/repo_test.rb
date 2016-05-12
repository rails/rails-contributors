require 'test_helper'

class RepoTest < ActiveSupport::TestCase
  test '#sync_ranks' do
    Repo.new.send(:sync_ranks)

    {jeremy: 1, david: 2, jose: 3, xavier: 3, vijay: 3}.each do |c, r|
      assert_equal r, contributors(c).rank
    end
  end

  test '#sync_first_contributed_timestamps' do
    Contributor.update_all(first_contribution_at: nil)
    Repo.new.send(:sync_first_contribution_timestamps)

    assert_first_contribution :commit_e0ef631, :david
    assert_first_contribution :commit_5b90635, :jeremy
    assert_first_contribution :commit_5b90635, :jose
    assert_first_contribution :commit_26c024e, :xavier
    assert_first_contribution :commit_6c65676, :vijay
  end

  test '#sync_first_contributed_timestamps rebuilding all' do
    Contributor.update_all(
      first_contribution_at: Commit.minimum(:committer_date) - 1.year
    )

    Repo.new(rebuild_all: true).send(:sync_first_contribution_timestamps)

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
