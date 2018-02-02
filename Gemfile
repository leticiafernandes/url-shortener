# frozen_string_literal: true

source "https://rubygems.org"
ruby '2.4.0'

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'sinatra', '~> 2.0.0', require: 'sinatra/base'
gem 'redis', '~> 4.0.1'
gem 'foreman', '~> 0.84.0'

group :development do
	gem 'pry'
end

group :test do
  gem 'rspec', '~> 3.7.0'
  gem 'selenium-webdriver', '~> 3.8.0'
  gem 'rack-test', require: 'rack/test'
  gem 'fakeredis', :require => 'fakeredis/rspec'
end