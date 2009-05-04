class ContributorsController < ApplicationController
  before_filter :set_since

  # Cache the home page.
  caches_page :index, :if => Proc.new {|c| c.params[:since].blank?}

  def index
    @contributors = Contributor.all_with_ncontributions_since(@since)
  end
end
