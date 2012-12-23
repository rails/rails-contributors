class CommitsController < ApplicationController
  before_filter :set_target
  before_filter :set_time_constraints, only: 'in_time_window'

  def index
    @commits = @target.commits.order('commits.author_date DESC')
  end

  def in_time_window
    commits = @target.commits
    commits = commits.since(@since) if @since
    @commits = commits.order('commits.author_date DESC')
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

    @target = @contributor || @release
  end
end
