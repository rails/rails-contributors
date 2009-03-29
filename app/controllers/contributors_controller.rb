class ContributorsController < ApplicationController
  caches_page :index

  def index
    @contributors = Contributor.all_grouped_by_commit
  end
end
