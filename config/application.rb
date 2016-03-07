require File.expand_path('../boot', __FILE__)

require 'rails'

%w[
  active_model
  active_record
  active_job
  action_controller
  action_mailer
  action_view
  sprockets
].each { |framework| require "#{framework}/railtie" }

Bundler.require(*Rails.groups)

module Ramona
  class Application < Rails::Application
    config.autoload_paths += Dir.glob("#{config.root}/app/interactions/*")
    config.autoload_paths += Dir.glob("#{config.root}/app/policies/*")
  end
end
