class CommitsController < ApplicationController
  before_filter :set_target
  before_filter :set_time_constraints

  caches_action :index, :if => lambda { |c|
    c.params[:window].blank? || c.params[:window] == 'all-time'
  }

  def index
    @commits = @target.commits.since(@since).order('author_date DESC')
  end

private
  def set_target
    if params[:contributor_id]
      @target = Contributor.find_by_url_id(params[:contributor_id])
    elsif params[:release_id]
      @target = Release.find_by_tag("v#{params[:release_id].tr('-', '.')}")
    end

    head :not_found unless @target
  end
end
