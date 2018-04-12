# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w(index_responsiveslides.js)
Rails.application.config.assets.precompile += %w(imagezoom.js)
Rails.application.config.assets.precompile += %w(jquery.flexslider.js)
Rails.application.config.assets.precompile += %w(flexslider.css)
Rails.application.config.assets.precompile += %w(single_animation.js)
Rails.application.config.assets.precompile += %w(User_profile.scss)
# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
