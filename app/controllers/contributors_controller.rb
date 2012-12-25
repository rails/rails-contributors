class ContributorsController < ApplicationController
  respond_to :html, :json

  before_filter :set_time_constraints

  caches_action :index, :if => lambda { |c|
    c.params[:window].blank? || c.params[:window] == 'all-time'
  }

  def index
    @contributors = Contributor.all_with_ncontributions_since(@since)
    respond_with(@contributors)
  end
end
