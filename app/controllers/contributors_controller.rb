class ContributorsController < ApplicationController
  before_filter :set_since

  caches_action :index, :if => lambda { |c| !c.params[:since].present? } 

  def index
    @contributors = Contributor.all_with_ncontributions_since(@since)
  end
end
