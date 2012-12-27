require 'test_helper'

class CommitsControllerTest < ActionController::TestCase
  def test_index_for_releases
    cases = [
      [:v3_2_0, [:commit_6c65676, :commit_5b90635]],
      [:v2_3_2, []],
      [:v0_14_4, [:commit_e0ef631]],
    ].map {|a, b| [releases(a), Array(commits(*b))]}

    cases.each do |release, commits|
      get :index, release_id: release

      assert_response :success
      assert_equal commits, assigns(:commits)

      label = commits.size == 1 ? 'commit' : 'commits'
      assert_select 'span.listing-total', "Showing #{commits.size} #{label}"
      assert_select 'li.current', 'Releases'
    end
  end

  def test_index_for_contributors
    cases = [
      [:david, [:commit_339e4e8, :commit_e0ef631]],
      [:jeremy, [:commit_b821094, :commit_5b90635]],
      [:jose, [:commit_5b90635]]
    ].map {|a, b| [contributors(a), Array(commits(*b))]}

    cases.each do |contributor, commits|
      get :index, contributor_id: contributor

      assert_response :success
      assert_equal commits, assigns(:commits)

      label = commits.size == 1 ? 'commit' : 'commits'
      assert_select 'span.listing-total', "Showing #{commits.size} #{label}"
      assert_select 'li.current', 'All time'
    end
  end
end
