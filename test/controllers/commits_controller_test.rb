require 'test_helper'

class CommitsControllerTest < ActionController::TestCase
  def test_index_for_releases
    cases = [
      [:v3_2_0,  [:commit_6c65676, :commit_5b90635]],
      [:v2_3_2,  []],
      [:v0_14_4, [:commit_e0ef631]],
    ].map {|a, b| [releases(a), Array(commits(*b))]}

    cases.each do |release, commits|
      get :index, params: { release_id: release }

      assert_response :success
      assert_equal commits, assigns(:commits)

      label = commits.size == 1 ? 'commit' : 'commits'
      assert_select 'span.listing-total', "Showing #{commits.size} #{label}"
      assert_select 'li.current', 'Releases'
    end
  end

  def test_index_for_contributors
    cases = [
      [:david,  [:commit_339e4e8, :commit_e0ef631]],
      [:jeremy, [:commit_b821094, :commit_7cdfd91, :commit_5b90635]],
      [:jose,   [:commit_5b90635]],
    ].map {|a, b| [contributors(a), Array(commits(*b))]}

    cases.each do |contributor, commits|
      get :index, params: { contributor_id: contributor }

      assert_response :success
      assert_equal commits, assigns(:commits)

      label = commits.size == 1 ? 'commit' : 'commits'
      assert_select 'span.listing-total', "Showing #{commits.size} #{label}"
      assert_select 'li.current', 'All time'
    end
  end

  def test_commits_in_time_window
    since      = '20121219'
    date_range = '20121201-20121231'

    cases = {
      contributors(:david) => [
        ['all-time',  [:commit_339e4e8, :commit_e0ef631]],
        ['today',     []],
        ['this-week', []],
        ['this-year', :commit_339e4e8],
        [since,       []],
        [date_range,  :commit_339e4e8],
      ].map {|a, b| [a, Array(commits(*b))]},

      contributors(:jeremy) => [
        ['all-time',  [:commit_b821094, :commit_7cdfd91, :commit_5b90635]],
        ['today',     :commit_b821094],
        ['this-week', :commit_b821094],
        ['this-year', [:commit_b821094, :commit_7cdfd91, :commit_5b90635]],
        [since,       :commit_b821094],
        [date_range,  :commit_b821094],
      ].map {|a, b| [a, Array(commits(*b))]},

      contributors(:vijay) => [
        ['all-time',  :commit_6c65676],
        ['today',     []],
        ['this-week', []],
        ['this-year', :commit_6c65676],
        [since,       []],
        [date_range,  []],
      ].map {|a, b| [a, Array(commits(*b))]},
    }

    time_travel do
      cases.each do |contributor, commits_per_time_window|
        commits_per_time_window.each do |time_window, commits|
          get :in_time_window, params: { contributor_id: contributor, time_window: time_window }

          assert_response :success
          assert_equal commits, assigns(:commits)

          label = commits.size == 1 ? 'commit' : 'commits'
          assert_select 'span.listing-total', "Showing #{commits.size} #{label}"
          if time_window == since || time_window == date_range
            assert_select 'li.current', false
          else
            assert_select 'li.current', TimeConstraints.label_for(time_window)
          end
        end
      end
    end
  end

  def test_in_release
    cases = {
      contributors(:jeremy) => {releases('v3_2_0') => [commits(:commit_5b90635)],
      contributors(:xavier) => {}},
      contributors(:david)  => {releases('v0_14_4') => [commits(:commit_e0ef631)]},
    }

    all_releases = Release.all
    cases.each do |contributor, releases|
      all_releases.each do |release|
        commits = releases[release] || []

        get :in_release, params: { contributor_id: contributor, release_id: release }

        assert_response :success
        assert_equal commits, assigns(:commits)

        label = commits.size == 1 ? 'commit' : 'commits'
        assert_select 'span.listing-total', "Showing #{commits.size} #{label}"
        assert_select 'li.current', 'Releases'
      end
    end
  end

  def test_in_edge
    cases = [
      [:david,  [:commit_339e4e8]],
      [:jeremy, [:commit_b821094, :commit_7cdfd91]],
      [:xavier, [:commit_26c024e]],
    ].map {|a, b| [contributors(a), Array(commits(*b))]}

    cases.each do |contributor, commits|
      get :in_edge, params: { contributor_id: contributor }

      assert_response :success
      assert_equal commits, assigns(:commits)

      label = commits.size == 1 ? 'commit' : 'commits'
      assert_select 'span.listing-total', "Showing #{commits.size} #{label}"
      assert_select 'li.current', 'Edge'
    end
  end
end
