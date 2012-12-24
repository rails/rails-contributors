class ContributorsController < ApplicationController
  def index
    @contributors = if params[:release_id].present?
      set_release
      Contributor.all_with_ncontributions_by_release(@release)
    else
      Contributor.all_with_ncontributions
    end
  end

  def in_time_window
    set_time_constraints
    @contributors = Contributor.all_with_ncontributions_by_date(@since)
    render 'index'
  end
end
