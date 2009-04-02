class NamesMappingsController < ApplicationController
  def show
    @names_mapping = NamesManager::SEEN_ALSO_AS
    @special_cases = NamesManager.special_cases
  end
end
