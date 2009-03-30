class CommitsController < ApplicationController
  caches_page :index

  before_filter :set_contributor
  before_filter :set_since

  def index
    @commits = @contributor.commits_since(@since)
  end

private
  def set_contributor
    @contributor = Contributor.find_by_url_id(params[:contributor_id])
    redirect_to contributors_url if not @contributor
  end
end
