require 'test_helper'

class TimeConstraintsTest < ActiveSupport::TestCase
  def test_label_for_returns_a_label_for_a_known_key
    assert_equal 'All time', TimeConstraints.label_for('all-time')
  end

  def test_label_for_returns_nil_otherwise
    assert_nil TimeConstraints.label_for('unkonwn-key')
  end

  def test_known_key_returns_true_for_known_keys
    assert TimeConstraints.known_key?('all-time')
  end

  def test_known_key_returns_false_for_unknown_keys
    assert !TimeConstraints.known_key?('unknown-key')
  end

  def test_since_for_returns_nil_for_all_time
    assert_nil TimeConstraints.since_for('all-time')
  end

  def test_since_for_returns_today_for_today
    time_travel do
      assert_equal TODAY, TimeConstraints.since_for('today')
    end
  end

  def test_since_for_returns_beginning_of_week_for_this_week
    time_travel do
      assert_equal DateTime.new(2012, 12, 24), TimeConstraints.since_for('this-week')
    end
  end

  def test_since_for_returns_beginning_of_month_for_this_month
    time_travel do
      assert_equal DateTime.new(2012, 12, 1), TimeConstraints.since_for('this-month')
    end
  end

  def test_since_for_returns_beginning_of_year_for_this_year
    time_travel do
      assert_equal DateTime.new(2012, 1, 1), TimeConstraints.since_for('this-year')
    end
  end
end