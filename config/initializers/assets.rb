# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.

Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.initialize_on_precompile = true

Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'fonts')

Rails.application.config.assets.precompile += %w( manifest.js stylesheets.css rademade_admin.css rademade_admin.js )
Rails.application.config.assets.precompile += %w(.svg .eot .woff .ttf)