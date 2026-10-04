require 'test_helper'

class ContributorsControllerTest < ActionController::TestCase
  def test_index_main_listing
    # Order by ncommits DESC, url_id ASC.
    expected = [[:jeremy, 3], [:david, 2], [:jose, 2], [:vijay, 1], [:xavier, 1]]

    get :index

    assert_response :success

    actual = assigns(:contributors)
    assert_equal expected.size, actual.size

    expected.zip(actual).each do |e, a|
      contributor = contributors(e.first)

      assert_equal contributor.name, a.name
      assert_equal e.second, a.ncommits

      assert_select "tr##{contributor.name.downcase.tr(' ', '-') }" do |elements|
        assert_select 'td.contributor-rank', "##{contributor.rank.to_s}"
        assert_select 'td.contributor-name', /#{contributor.name}/
        assert_select 'td.contributor-timestamp' do |elements|
          assert_equal 2, elements.size
          assert_equal contributor.first_contribution_at.strftime("%d %b %Y"), elements[0].text.strip
          assert_equal contributor.last_contribution_at.strftime("%d %b %Y"), elements[1].text.strip
        end
        assert_select "td.no-commits", e.second.to_s
      end
    end
  end

  def test_index_by_release
    releases = {
      'v4.0.0'  => [[:jose, 1]],
      'v3.2.0'  => [[:jeremy, 1], [:jose, 1], [:vijay, 1]],
      'v0.14.4' => [[:david, 1]]
    }

    Release.all.each do |release|
      get :index, params: { release_id: release }

      assert_response :success

      actual = assigns(:contributors)

      if expected = releases[release.tag]
        assert_equal expected.size, actual.size
        expected.zip(actual) do |e, a|
          assert_equal contributors(e.first).name, a.name
          assert_equal e.second, a.ncommits
        end
      else
        assert_equal [], actual
      end
    end
  end

  def test_in_time_window
    since      = '20121219'
    date_range = '20121201-20121231'

    time_windows = {
      'all-time'   => [[:jeremy, 3], [:david, 2], [:jose, 2], [:vijay, 1], [:xavier, 1]],
      'today'      => [[:jeremy, 1]],
      'this-week'  => [[:jeremy, 1], [:xavier, 1]],
      'this-month' => [[:david, 1], [:jeremy, 1], [:xavier, 1]],
      'this-year'  => [[:jeremy, 3], [:jose, 2], [:david, 1], [:vijay, 1], [:xavier, 1]],
      since        => [[:jeremy, 1], [:xavier, 1]],
      date_range   => [[:david, 1], [:jeremy, 1], [:xavier, 1]],
    }

    time_travel do
      time_windows.each do |time_window, expected|
        get :in_time_window, params: { time_window: time_window }

        assert_response :success

        actual = assigns(:contributors)
        assert_equal expected.size, actual.size

        expected.zip(actual).each do |e, a|
          assert_equal contributors(e.first).name, a.name
          assert_equal e.second, a.ncommits
        end
      end
    end
  end

  def test_in_edge
    # Order by ncommits DESC, url_id ASC.
    expected = [[:jeremy, 2], [:david, 1], [:xavier, 1]]

    get :in_edge

    assert_response :success

    actual = assigns(:contributors)
    assert_equal expected.size, actual.size

    expected.zip(actual).each do |e, a|
      assert_equal contributors(e.first).name, a.name
      assert_equal e.second, a.ncommits
    end
  end
end
