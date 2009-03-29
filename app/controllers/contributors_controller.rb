class ContributorsController < ApplicationController
  caches_page :index

  before_filter :set_since

  def index
    @contributors = Contributor.all_grouped_by_commit_since(@since)
  end
end
