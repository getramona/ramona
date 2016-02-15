# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Use custom asset directories.
Rails.application.config.assets.paths << "#{Rails.root}/app/assets/css"
Rails.application.config.assets.paths << "#{Rails.root}/app/assets/img"
Rails.application.config.assets.paths << "#{Rails.root}/app/assets/jsc"
Rails.application.config.assets.paths << "#{Rails.root}/app/assets/fonts"

# Include the Susy Sass library.
Rails.application.config.compass.require 'susy'
