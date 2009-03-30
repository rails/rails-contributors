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
    Time.today.beginning_of_week.to_date
  end

  def this_month
    Time.today.beginning_of_month.to_date
  end

  def this_year
    Time.today.beginning_of_year.to_date
  end
end
