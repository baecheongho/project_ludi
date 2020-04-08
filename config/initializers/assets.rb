# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.paths << Rails.root.join('vendor')
Rails.application.config.assets.paths << Rails.root.join('fonts')
Rails.application.config.assets.precompile += %w( bootstrap4-toggle.min.js )
Rails.application.config.assets.precompile += %w( report.scss )
#Rails.application.config.assets.precompile += %w( jquery.js )
#Rails.application.config.assets.precompile += %w( jquery-ui.js )
Rails.application.config.assets.precompile += %w( bootstrap-datepicker.min.js )
#Rails.application.config.assets.precompile += %w( bootstrap.min.css )
Rails.application.config.assets.precompile += %w( core/jquery.min.js )
Rails.application.config.assets.precompile += %w( core/popper.min.js )
Rails.application.config.assets.precompile += %w( core/bootstrap.min.js)
Rails.application.config.assets.precompile += %w( other/perfect-scrollbar.jquery.min.js )
Rails.application.config.assets.precompile += %w( other/chartjs.min.js )
Rails.application.config.assets.precompile += %w( other/bootstrap-notify.js )
Rails.application.config.assets.precompile += %w( dashboard-main.js )
#Rails.application.config.assets.precompile += %w( dashboard-main.min.js )
#Rails.application.config.assets.precompile += %w( t.js )
Rails.application.config.assets.precompile += %w( css/dashboard-main.css )
Rails.application.config.assets.precompile += %w( css/nucleo-icons.css )
Rails.application.config.assets.precompile += %w( chart.js )
Rails.application.config.assets.precompile += %w( chart2.js )
Rails.application.config.assets.precompile += %w( jquery-3.4.1.min.js )
Rails.application.config.assets.precompile += %w( jquery-ui )
Rails.application.config.assets.precompile += %w( jquery-ui.css )
Rails.application.config.assets.precompile += %w( dashboard-func.js )
Rails.application.config.assets.precompile += %w( dashboard.js )
Rails.application.config.assets.precompile += %w( history.css.scss )
Rails.application.config.assets.precompile += %w( register.css.scss )
Rails.application.config.assets.precompile += %w( moment-with-locales.js )

Rails.application.config.assets.precompile += %w( bootstrap-material-datetimepicker.min.css )
Rails.application.config.assets.precompile += %w( bootstrap-material-datetimepicker.min.js  )


#Rails.application.config.assets.precompile += %w( all.css )
#Rails.application.config.assets.precompile += %w( all.min.css )



# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
