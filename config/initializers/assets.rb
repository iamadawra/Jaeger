# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( users.js )
Rails.application.config.assets.precompile += %w( videos.js )
Rails.application.config.assets.precompile += %w( upload_videos.js )
Rails.application.config.assets.precompile += %w( competitions.js )
Rails.application.config.assets.precompile += %w( sessions.js )
Rails.application.config.assets.precompile += %w( video_carts.js )
Rails.application.config.assets.precompile += %w( admin.js )
Rails.application.config.assets.precompile += %w( password_resets.js )

Rails.application.config.assets.precompile += %w( users.css )
Rails.application.config.assets.precompile += %w( videos.css )
Rails.application.config.assets.precompile += %w( upload_videos.css )
Rails.application.config.assets.precompile += %w( competitions.css )
Rails.application.config.assets.precompile += %w( sessions.css )
Rails.application.config.assets.precompile += %w( login.css )
Rails.application.config.assets.precompile += %w( style.css )
Rails.application.config.assets.precompile += %w( stylesheet.css )
Rails.application.config.assets.precompile += %w( video_carts.css )
Rails.application.config.assets.precompile += %w( admin.css )
Rails.application.config.assets.precompile += %w( password_resets.css )

Rails.application.config.assets.precompile += %w( GandhiSans-Regular-webfont.eot )
Rails.application.config.assets.precompile += %w( GandhiSans-Regular-webfont.woff )