# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Rails
ruby '3.0.4'
gem 'bootsnap', require: false
gem 'image_processing', '~> 1.2'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.4'
gem 'ransack'
gem 'redis', '~> 4.0'
gem 'sprockets-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Javascript
gem 'importmap-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

# 3rd party gems
gem 'devise'
gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'main'
gem 'friendly_id'
gem 'noticed', '~> 1.6'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'pry'
end

group :development do
  gem 'bullet'
  gem 'rack-mini-profiler'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
