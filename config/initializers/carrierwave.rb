CarrierWave.configure do |config|

  # Set storage to file in test
  config.storage = Rails.env.test? ? :file : :fog

  # Turn off processing in test
  config.enable_processing = !Rails.env.test?
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
  }
  config.fog_directory = "ramona-#{Rails.env}"
end
