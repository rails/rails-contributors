require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

require_relative "../lib/bot_killer"

module RailsContributors
  class Application < Rails::Application
    config.load_defaults 6.1
    config.add_autoload_paths_to_load_path = false
    config.middleware.insert 0, BotKiller
  end
end
