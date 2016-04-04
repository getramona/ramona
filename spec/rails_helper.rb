ENV['RAILS_ENV'] ||= 'test'

require 'simplecov'

SimpleCov.start 'rails'

require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'spec_helper'
require 'rspec/rails'

require 'shoulda/matchers'
require 'pundit/rspec'
require 'carrierwave/test/matchers'

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include CarrierWave::Test::Matchers

  config.before :suite do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :transaction
  end

  config.before do
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end

def example_avatar
  Rails.root.join('spec', 'fixtures', 'avatar.jpg')
end

def example_psd
  Rails.root.join('spec', 'fixtures', 'psd.psd')
end
