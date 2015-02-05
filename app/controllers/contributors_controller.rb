class ContributorsController < ApplicationController
  caches_page :index, :in_time_window, :in_week, :in_edge

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

    @contributors = if @since
      Contributor.all_with_ncommits_by_date(@since)
    else
      Contributor.all_with_ncommits
    end

    render 'index'
  end

  def in_week
    @week_start = Date.iso8601(params[:date]).beginning_of_week
    @contributors = Contributor.all_with_ncommits_in_week_of(@week_start)

    render 'index'
  end

  def in_edge
    @edge = true
    @contributors = Contributor.all_with_ncommits_in_edge

    render 'index'
  end
end
