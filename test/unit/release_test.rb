require 'test_helper'

class ReleaseTest < ActiveSupport::TestCase
  def check_version_split(tag, major=0, minor=0, tiny=0, patch=0)
    r = Release.new(tag: tag)
    assert_equal major, r.major
    assert_equal minor, r.minor
    assert_equal tiny, r.tiny
    assert_equal patch, r.patch
  end

  def ordered_releases
    %w(
      v3_2_0
      v2_3_2_1
      v2_3_2
      v1_0_0
      v0_14_4
    ).map {|tag| releases(tag)}
  end

  def test_the_tag_writer_splits_the_version
    check_version_split('v4', 4)
    check_version_split('v3.2', 3, 2)
    check_version_split('v3.2.0', 3, 2, 0)
    check_version_split('v3.2.1', 3, 2, 1)
    check_version_split('v2.3.2.1', 2, 3, 2, 1)
  end

  def test_name
    assert_equal '3.2.0', releases(:v3_2_0).name
  end

  def test_to_param
    assert_equal '3-2-0',   releases(:v3_2_0).to_param
    assert_equal '2-3-2-1', releases(:v2_3_2_1).to_param
  end

  def test_find_by_param
    r = releases(:v3_2_0)
    assert_equal r, Release.find_by_param(r.to_param)
  end

  def test_github_url
    assert_equal 'https://github.com/rails/rails/tree/v3.2.0', releases(:v3_2_0).github_url
  end

  def test_the_date_writer_corrects_the_date_if_needed
    date = DateTime.new(2011, 8, 30, 18, 58, 35)
    r = Release.new(tag: 'v3.1.0', date: date)
    assert_equal date, r.date

    date = DateTime.new(2005, 12, 13)
    r = Release.new(tag: 'v1.0.0', date: DateTime.current)
    assert_equal date, r.date
  end

  def test_spaceship_operator
    ordered_releases.each_cons(2) do |r, t|
      assert r > t
    end
  end

  def test_prev
    ordered_releases.each_cons(2) do |r, t|
      assert_equal t, r.prev
    end
  end
end
