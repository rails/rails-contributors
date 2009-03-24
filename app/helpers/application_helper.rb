# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def link_to_commit(commit)
    link_to commit.short_hash, commit.github_url, :class => 'commit'
  end

  def genitiveize(name)
    result = name + "'"
    result << 's' unless name.ends_with?('s')
    result
  end
end
