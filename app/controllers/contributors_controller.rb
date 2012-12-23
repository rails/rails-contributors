class ContributorsController < ApplicationController
  before_filter :set_release, only: 'in_release'
  before_filter :set_time_constraints, only: 'in_time_window'

  def index
    @contributors = if params[:release_id].present?
      set_release
      Contributor.all_with_ncontributions_by_release(@release)
    else
      Contributor.all_with_ncontributions
    end
  end

  def in_time_window
    @contributors = Contributor.all_with_ncontributions_by_date(@since)
    render 'index'
  end

  def in_release
    @contributors =
    render 'index'
  end
end
