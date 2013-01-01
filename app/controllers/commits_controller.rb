class CommitsController < ApplicationController
  caches_page :index, :in_time_window, :in_release, :in_edge

  before_filter :set_target, only: %w(index in_release)
  before_filter :set_contributor, only: %w(in_edge in_time_window)
  before_filter :set_time_constraints, only: 'in_time_window'

  def index
    @commits = @target.commits.sorted
  end

  def in_time_window
    commits = @contributor.commits
    commits = commits.since(@since) if @since
    @commits = commits.sorted
    render 'index'
  end

  def in_release
    @commits = @contributor.commits.release(@release).sorted
    render 'index'
  end

  def in_edge
    @edge = true
    @commits = @contributor.commits.edge.sorted
    render 'index'
  end

  private

  def set_target
    if params[:contributor_id].present?
      set_contributor
    end

    if params[:release_id].present?
      set_release
    end

    @target = @contributor || @release
  end
end
