class ContributorsController < ApplicationController
  before_filter :set_time_constraints

  caches_action :index, :if => lambda { |c| !c.params[:window].present? }

  def index
    @contributors = Contributor.all_with_ncontributions_since(@since)
  end
end
