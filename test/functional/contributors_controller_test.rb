require 'test_helper'

class ContributorsControllerTest < ActionController::TestCase
  def test_index_main_listing
    # Order by ncommits DESC, url_id ASC.
    expected = [[:david, 2], [:jeremy, 2], [:jose, 1], [:vijay, 1], [:xavier, 1]]

    get :index

    actual = assigns(:contributors)
    assert_equal expected.size, actual.size

    expected.zip(actual).each do |e, a|
      assert_equal contributors(e.first).name, a.name
      assert_equal e.second, a.ncommits
    end
  end

  def test_index_by_release
    releases = {
      'v3.2.0'  => [[:jeremy, 1], [:jose, 1], [:vijay, 1]],
      'v0.14.4' => [[:david, 1]]
    }

    Release.all.each do |release|
      get :index, release_id: release

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
    time_windows = {
      'all-time'   => [[:david, 2], [:jeremy, 2], [:jose, 1], [:vijay, 1], [:xavier, 1]],
      'today'      => [[:jeremy, 1]],
      'this-week'  => [[:jeremy, 1], [:xavier, 1]],
      'this-month' => [[:david, 1], [:jeremy, 1], [:xavier, 1]],
      'this-year'  => [[:jeremy, 2], [:david, 1], [:jose, 1], [:vijay, 1], [:xavier, 1]]
    }

    time_travel do
      time_windows.each do |time_window, expected|
        get :in_time_window, time_window: time_window

        actual = assigns(:contributors)
        assert_equal expected.size, actual.size

        expected.zip(actual).each do |e, a|
          assert_equal contributors(e.first).name, a.name
          assert_equal e.second, a.ncommits
        end
      end
    end
  end
end
