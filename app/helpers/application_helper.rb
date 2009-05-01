# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def link_to_commit(commit)
    link_to %(<span class="sha1">#{commit.short_sha1}</span>), commit.github_url, :class => 'commit'
  end

  def link_to_contributor(contributor, since)
    params = since ? {:since => since.to_s(:number)} : {}
    link_to h(contributor.name), contributor_commits_path(contributor, params)
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

  def add_since_to(title, since)
    today = Date.today
    constraint = case since
    when today.beginning_of_week
      "This week"
    when today.beginning_of_month
      "This month"
    when today.beginning_of_year
      "This year"
    when NilClass
      "All time"
    else
      "Since #{since.to_s(:long_ordinal)}"
    end
    "#{title} - #{constraint}"
  end

  def sidebar_tab(name, options={}, html_options={})
    style = current_page?(options) ? ' class="current"' : ''
    return <<-HTML
      <li#{style}>
        #{link_to name, options, html_options}
      </li>
    HTML
  end
end
