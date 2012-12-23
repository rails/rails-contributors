class ContributorsController < ApplicationController
  before_filter :set_release
  before_filter :set_time_constraints

  caches_action :index, :if => lambda { |c|
    c.params[:window].blank? || c.params[:window] == 'all-time'
  }

  def index
    if @release
      @contributors = Contributor.all_with_ncontributions_by_release(@release)
    elsif @since
      @contributors = Contributor.all_with_ncontributions_by_date(@since)
    else
      @contributors = Contributor.all_with_ncontributions
    end
  end
end
