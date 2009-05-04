class ContributorsController < ApplicationController
  before_filter :set_since

  def index
    @contributors = Contributor.all_with_ncontributions_since(@since)
  end
end
