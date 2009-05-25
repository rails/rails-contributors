module TimeConstraints
  ALL_EXCEPT_ALL_TIME = [
    ['today',      'Today'],
    ['this-week',  'This week'],
    ['this-month', 'This month'],
    ['this-year',  'This year']]

  ALL = [[nil, 'All time']] + ALL_EXCEPT_ALL_TIME

  def self.label_for(key)
    ALL.assoc(key)[1]
  end

  def self.known_key?(key)
    ALL.assoc(key)
  end

  # These date objects have to be computed per call, they can't be associated
  # to the keys in the constants.
  def self.since_for(key)
    case key
      when 'today'
        Date.today
      when 'this-week'
        Date.today.beginning_of_week
      when 'this-month'
        Date.today.beginning_of_month
      when 'this-year'
        Date.today.beginning_of_year
      else
        nil
    end
  end
end
