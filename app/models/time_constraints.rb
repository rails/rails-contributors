module TimeConstraints
  ALL = {
    'all-time'   => 'All time',
    'today'      => 'Today',
    'this-week'  => 'This week',
    'this-month' => 'This month',
    'this-year'  => 'This year',
  }

  DATE_RANGE = /\A(\d+)(?:-(\d+))?\z/

  def self.all
    ALL
  end

  def self.label_for(key)
    ALL[key] || 'Date Range'
  end

  def self.valid_time_window?(key)
    ALL[key] || key =~ DATE_RANGE
  end

  # These date objects have to be computed per call, they can't be associated
  # to the keys.
  def self.time_window_for(key)
    case key
    when 'all-time'
      {}
    when 'today'
      { since: Date.current.beginning_of_day }
    when 'this-week'
      { since: Date.current.beginning_of_week }
    when 'this-month'
      { since: Date.current.beginning_of_month }
    when 'this-year'
      { since: Date.current.beginning_of_year }
    when DATE_RANGE
      { since: parse_time($1, false), upto: parse_time($2, true) }
    else
      raise ArgumentError, "Unknown time window key #{key}"
    end
  end

  def self.parse_time(str, end_of_day_if_date)
    if str
      time = Time.zone.parse(str)
      str.length == 8 && end_of_day_if_date ? time.end_of_day : time
    end
  end
end
