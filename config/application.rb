require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ramona
  class Application < Rails::Application
    config.autoload_paths += Dir.glob("#{config.root}/app/interactions/*")
    config.autoload_paths += Dir.glob("#{config.root}/app/contexts/*")
    config.autoload_paths += Dir.glob("#{config.root}/app/policies/*")

    config.time_zone = 'Eastern Time (US & Canada)'
    config.active_record.default_timezone = :local
  end
end
