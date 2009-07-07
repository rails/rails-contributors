# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def link_to_commit(commit)
    link_to %(<span class="sha1">#{commit.short_sha1}</span>), commit.github_url, :class => 'commit'
  end

  def link_to_contributor(contributor, window)
    query = window == 'all-time'? {} : {:window => window}
    link_to h(contributor.name), contributor_commits_path(contributor, query)
  end

  def genitiveize(name)
    result = name + "'"
    result << 's' unless name.ends_with?('s')
    result
  end

  def add_window_to(title, window)
    "#{title} - #{TimeConstraints.label_for(window)}"
  end

  def sidebar_tab(name, current, options={}, html_options={})
    style = current ? ' class="current"' : ''
    return <<-HTML
      <li#{style}>
        #{link_to name, options, html_options}
      </li>
    HTML
  end

  def normalize_title(title)
    title = title.starts_with?("Rails Contributors") ? title : "Rails Contributors - #{title}"
    strip_tags(title)
  end
end
