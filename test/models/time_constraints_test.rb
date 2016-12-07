require 'test_helper'

class TimeConstraintsTest < ActiveSupport::TestCase
  def assert_time_window(actual, since = nil, upto = nil)
    [[since, :since], [upto, :upto]].each do |expected, key|
      # Written this way because assert_equal(nil, nil) fails in MT6.
      if expected.nil?
        assert_nil actual[key]
      else
        assert_equal expected, actual[key]
      end
    end
  end

  def test_label_for_returns_a_label_for_a_valid_time_window
    assert_equal 'All time', TimeConstraints.label_for('all-time')
    assert_equal 'Date Range', TimeConstraints.label_for('20150101')
    assert_equal 'Date Range', TimeConstraints.label_for('20150101-20150318')
  end

  def test_valid_time_window_returns_true_for_valid_time_windows
    assert TimeConstraints.valid_time_window?('all-time')
    assert TimeConstraints.valid_time_window?('20150101')
    assert TimeConstraints.valid_time_window?('20150101-20150318')
  end

  def test_valid_time_window_returns_false_for_invalid_time_windows
    assert !TimeConstraints.valid_time_window?('unknown-key')
  end

  def test_time_window_for_returns_an_empty_array_for_all_time
    assert_time_window TimeConstraints.time_window_for('all-time')
  end

  def test_time_window_for_returns_today_for_today
    time_travel do
      assert_time_window TimeConstraints.time_window_for('today'), TODAY
    end
  end

  def test_time_window_for_returns_beginning_of_week_for_this_week
    time_travel do
      assert_time_window TimeConstraints.time_window_for('this-week'), Time.zone.parse('2012-12-24')
    end
  end

  def test_time_window_for_returns_beginning_of_month_for_this_month
    time_travel do
      assert_time_window TimeConstraints.time_window_for('this-month'), Time.zone.parse('2012-12-01')
    end
  end

  def test_time_window_for_returns_beginning_of_year_for_this_year
    time_travel do
      assert_time_window TimeConstraints.time_window_for('this-year'), Time.zone.parse('2012-01-01')
    end
  end

  def test_time_window_for_parses_dates
    assert_time_window TimeConstraints.time_window_for('20180318'), Time.zone.parse('2018-03-18')
  end

  def test_time_window_for_parses_timestamps
    assert_time_window TimeConstraints.time_window_for('201803181721'), Time.zone.parse('2018-03-18 17:21')
  end

  def test_time_window_for_parses_date_ranges
    assert_time_window TimeConstraints.time_window_for('20180318-20150319'), Time.zone.parse('2018-03-18'), Time.zone.parse('2015-03-19').end_of_day
  end

  def test_time_window_for_parses_timestamp_ranges
    assert_time_window TimeConstraints.time_window_for('201803181721-201503191807'), Time.zone.parse('2018-03-18 17:21'), Time.zone.parse('2015-03-19 18:07')
  end

  def test_time_window_for_parses_mixed_ranges
    assert_time_window TimeConstraints.time_window_for('20180318-201503191807'), Time.zone.parse('2018-03-18 00:00'), Time.zone.parse('2015-03-19 18:07')
    assert_time_window TimeConstraints.time_window_for('201803181721-20150319'), Time.zone.parse('2018-03-18 17:21'), Time.zone.parse('2015-03-19').end_of_day
  end
end
