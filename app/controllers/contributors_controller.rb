class ContributorsController < ApplicationController
  caches_page :index, :in_time_window, :in_edge

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
      Contributor.all_with_ncommits_by_time_window(@since, @upto)
    else
      Contributor.all_with_ncommits
    end

    render 'index'
  end

  def in_edge
    @edge = true
    @contributors = Contributor.all_with_ncommits_in_edge

    render 'index'
  end
end
