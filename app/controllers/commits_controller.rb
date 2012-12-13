class CommitsController < ApplicationController
  before_filter :set_contributor
  before_filter :set_time_constraints

  caches_action :index, :if => lambda { |c|
    c.params[:window].blank? || c.params[:window] == 'all-time'
  }

  def index
    @commits = @contributor.commits.since(@since).order('committer_date DESC')
  end

private
  def set_contributor
    @contributor = Contributor.find_by_url_id(params[:contributor_id])
    head :not_found unless @contributor
  end
end
