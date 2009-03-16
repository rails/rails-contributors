class ContributionsController < ApplicationController
  before_filter :set_contributor

  # TODO
  def index
    # Builds @contributor's page, one line per commit, hash prefix and subject,
    # linked to github.
  end

private
  def set_contributor
    @contributor = Contributor.find_by_url_id(params[:contributor_id])
    redirect_to contributors_url if not @contributor
  end
end
