# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'rails', '~> 6.1.4', '>= 6.1.4.1'

gem 'bootsnap', '>= 1.4.4', require: false # Reduces boot times through caching; required in config/boot.rb
gem 'devise' # Authentication.
gem 'puma', '~> 5.0' # App server
gem 'responders' # Responders to dry
gem 'sass-rails', '>= 6' # Use SCSS for stylesheets
gem 'simple_form' # Form helper.
gem 'sqlite3', '~> 1.4' # Sqlite3 as the database for Active Record
gem 'turbolinks', '~> 5' # Makes navigating your web application faster
gem 'webpacker', '~> 5.0' # Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker

group :test do
  gem 'database_cleaner-active_record'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers', '~> 5.0'
end

group :development, :test do
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end
