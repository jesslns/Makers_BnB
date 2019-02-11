# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

ruby '2.5.1'

# gem "rails"
gem 'sinatra'
gem 'pg'
gem 'timecop'
gem 'bcrypt'
gem 'sinatra-flash'

group :test do
  gem 'capybara'
  gem 'rspec'
  gem 'rubocop', '0.56.0'
  gem 'selenium-webdriver'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end
