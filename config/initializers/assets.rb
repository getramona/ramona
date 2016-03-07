# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path
Rails.application.config.assets.paths << "#{Rails.root}/app/assets/css"
Rails.application.config.assets.paths << "#{Rails.root}/app/assets/img"
Rails.application.config.assets.paths << "#{Rails.root}/app/assets/jsc"
Rails.application.config.assets.paths << "#{Rails.root}/app/assets/fonts"

# Include the Susy Sass library.
Rails.application.config.compass.require 'susy'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
