class Release < ActiveRecord::Base
  before_create :split_version
  before_create :fix_date

  def name
    tag[1..-1]
  end

  private

  def split_version
    numbers = name.split('.')

    self.major = numbers[0].to_i
    self.minor = numbers[1].to_i
    self.tiny  = numbers[2].to_i
    self.patch = numbers[3].to_i
  end

  def fix_date
    self.date = actual_date_for_release
  end

  # Releases coming from Subversion were tagged in 2008 when the repo was
  # imported into git. I have scrapped
  #
  #   http://rubyforge.org/frs/?group_id=307
  #
  # to generate this case statement.
  def actual_date_for_release
    case tag
    when 'v0.5.0'
      DateTime.new(2004, 7, 24)
    when 'v0.5.5'
      DateTime.new(2004, 7, 28)
    when 'v0.5.6'
      DateTime.new(2004, 7, 29)
    when 'v0.5.7'
      DateTime.new(2004, 8, 1)
    when 'v0.6.0'
      DateTime.new(2004, 8, 6)
    when 'v0.6.5'
      DateTime.new(2004, 8, 20)
    when 'v0.7.0'
      DateTime.new(2004, 9, 5)
    when 'v0.8.0'
      DateTime.new(2004, 10, 25)
    when 'v0.8.5'
      DateTime.new(2004, 11, 17)
    when 'v0.9.0'
      DateTime.new(2004, 12, 16)
    when 'v0.9.1'
      DateTime.new(2004, 12, 17)
    when 'v0.9.2'
      DateTime.new(2004, 12, 23)
    when 'v0.9.3'
      DateTime.new(2005, 1, 4)
    when 'v0.9.4'
      DateTime.new(2005, 1, 17)
    when 'v0.9.4.1'
      DateTime.new(2005, 1, 18)
    when 'v0.9.5'
      DateTime.new(2005, 1, 25)
    when 'v0.10.0'
      DateTime.new(2005, 2, 24)
    when 'v0.10.1'
      DateTime.new(2005, 3, 7)
    when 'v0.11.0'
      DateTime.new(2005, 3, 22)
    when 'v0.11.1'
      DateTime.new(2005, 3, 27)
    when 'v0.12.0'
      DateTime.new(2005, 4, 19)
    when 'v0.12.1'
      DateTime.new(2005, 4, 19)
    when 'v0.13.0'
      DateTime.new(2005, 7, 6)
    when 'v0.13.1'
      DateTime.new(2005, 7, 11)
    when 'v0.14.1'
      DateTime.new(2005, 10, 19)
    when 'v0.14.2'
      DateTime.new(2005, 10, 26)
    when 'v0.14.3'
      DateTime.new(2005, 11, 7)
    when 'v0.14.4'
      DateTime.new(2005, 12, 8)
    when 'v1.0.0'
      DateTime.new(2005, 12, 13)
    when 'v1.1.0'
      DateTime.new(2006, 3, 28)
    when 'v1.1.1'
      DateTime.new(2006, 4, 6)
    when 'v1.1.2'
      DateTime.new(2006, 4, 9)
    when 'v1.1.3'
      DateTime.new(2006, 6, 27)
    when 'v1.1.4'
      DateTime.new(2006, 6, 29)
    when 'v1.1.5'
      DateTime.new(2006, 8, 8)
    when 'v1.1.6'
      DateTime.new(2006, 8, 10)
    when 'v1.2.0'
      DateTime.new(2007, 1, 18)
    when 'v1.2.1'
      DateTime.new(2007, 1, 18)
    when 'v1.2.2'
      DateTime.new(2007, 2, 6)
    when 'v1.2.3'
      DateTime.new(2007, 3, 13)
    when 'v1.2.4'
      DateTime.new(2007, 10, 4)
    when 'v1.2.5'
      DateTime.new(2007, 10, 12)
    when 'v1.2.6'
      DateTime.new(2007, 11, 24)
    when 'v2.0.0'
      DateTime.new(2007, 12, 6)
    when 'v2.0.1'
      DateTime.new(2007, 12, 7)
    when 'v2.0.2'
      DateTime.new(2007, 12, 16)
    when 'v2.0.4'
      DateTime.new(2008, 9, 4)
    when 'v2.1.0'
      DateTime.new(2008, 5, 31)
    else
      date
    end
  end
end
