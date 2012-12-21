class ReleasesController < ApplicationController
  def index
    @releases = Release.all_with_ncommits_and_ncontributors
  end
end
