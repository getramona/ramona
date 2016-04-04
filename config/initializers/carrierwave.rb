require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  include CarrierWave::MiniMagick

  # Set storage to file in test
  config.storage = Rails.env.test? ? :file : :fog

  # Turn off processing in test
  config.enable_processing = !Rails.env.test?

  # Use the AWS Fog provider
  config.fog_provider = 'fog/aws'

  # Set credentials
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
  }

  # Change the AWS bucket
  config.fog_directory = "ramona-#{Rails.env}"
end
