source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.1.3'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"


gem 'simple_form'

gem 'acts_as_commentable_with_threading'
gem 'acts_as_follower'
gem 'public_activity'
gem 'geocoder'
gem 'elasticsearch-model'
gem 'elasticsearch-rails'
gem 'mini_magick'
gem 'active_storage_validations' # helpful for validations on photo uploads
gem 'friendly_id', '~> 5.4.0'
gem 'kaminari' # for pagination
gem 'ransack' # for advanced search functionality
gem 'devise_invitable' # for inviting users
gem 'omniauth' # for third-party authentication
gem 'omniauth-facebook' # for Facebook login
gem 'omniauth-google-oauth2' # for Google login

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 6.4"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS


gem 'rake', '13.0.6'

gem "image_processing", "~> 1.2"

gem 'devise'
gem 'twitter-bootstrap-rails'
gem 'devise-bootstrap-views'

gem 'jquery-rails'

gem 'pg', '>= 1.5.4', '< 2.0'
gem "tailwindcss-rails", "~> 3.3.1"
gem 'cssbundling-rails', '~> 1.1'
gem 'jsbundling-rails', '~> 1.1'


#gem 'mini_racer', platforms: :ruby



group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
