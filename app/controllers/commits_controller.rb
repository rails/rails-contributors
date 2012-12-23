class CommitsController < ApplicationController
  before_filter :set_target
  before_filter :set_time_constraints, only: 'in_time_window'

  def index
    target = @contributor || @release
    @commits = target.commits.order('commits.author_date DESC')
  end

  def in_time_window
    target = @contributor || @release
    @commits = target.commits.since(@since).order('commits.author_date DESC')
    render 'index'
  end

  def in_release
    @commits = @contributor.commits.where(release_id: @release.id)
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
  end
end
