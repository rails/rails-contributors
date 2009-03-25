class ContributorsController < ApplicationController
  caches_page :index

  def index
    @contributors = Contributor.all(:order => 'contributions_count DESC, name ASC')
  end
end
