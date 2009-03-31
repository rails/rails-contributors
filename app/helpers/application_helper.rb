# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def link_to_commit(commit)
    link_to commit.short_sha1, commit.github_url, :class => 'commit'
  end

  def genitiveize(name)
    result = name + "'"
    result << 's' unless name.ends_with?('s')
    result
  end

  def this_week
    Date.today.beginning_of_week.to_s(:number)
  end

  def this_month
    Date.today.beginning_of_month.to_s(:number)
  end

  def this_year
    Date.today.beginning_of_year.to_s(:number)
  end

  def add_since_to(title)
    today = Date.today
    constraint = case @since
    when today.beginning_of_week
      "This week"
    when today.beginning_of_month
      "This month"
    when today.beginning_of_year
      "This year"
    when NilClass
      "All time"
    else
      "Since #{@since.to_s(:long_ordinal)}"
    end
    "#{title} (#{constraint})"
  end
end
