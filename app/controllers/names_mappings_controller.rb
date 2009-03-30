class NamesMappingsController < ApplicationController
  def show
    @names_mapping = NamesManager::SEEN_ALSO_AS
    @special_cases = extract_special_cases
  end

private
  def extract_special_cases
    code = File.read(File.join(Rails.root, 'app', 'models', 'names_manager.rb'))
    code =~ /(^  #[^\n]+\n)+  def self\.handle_special_cases.*?^  end/m
    $&
  end
end
