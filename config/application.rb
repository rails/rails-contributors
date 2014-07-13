require File.expand_path('../boot', __FILE__)

require 'active_record/railtie'
require 'action_controller/railtie'
require 'rails/test_unit/railtie'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)

module RailsContributors
  class Application < Rails::Application
  end
end
