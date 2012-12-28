class ContributorsController < ApplicationController
  caches_page :index

  def index
    @contributors = if params[:release_id].present?
      set_release
      Contributor.all_with_ncommits_by_release(@release)
    else
      Contributor.all_with_ncommits
    end
  end

  def in_time_window
    set_time_constraints
    @contributors = Contributor.all_with_ncommits_by_date(@since)
    render 'index'
  end
end
