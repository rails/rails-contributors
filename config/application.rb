require File.expand_path('../boot', __FILE__)

require 'active_record/railtie'
require 'action_controller/railtie'
require 'sprockets/railtie'
require 'rails/test_unit/railtie'

Bundler.require(:default, Rails.env)

module RailsContributors
  class Application < Rails::Application
    config.encoding = 'utf-8'
  end
end
