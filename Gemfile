# frozen_string_literal: true

source "https://rubygems.org"

ruby "2.4.2"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem "excon", "~> 0.55.0"
gem "foreman", "~> 0.83.0"
gem "mini_magick", "~> 4.7.0"
gem "pg", "~> 0.18"
gem "puma", "~> 3.7"
gem "rack-cors", require: "rack/cors"
gem "rails", "~> 5.1", ">= 5.1.4"
gem "rollbar", "~> 2.14.0"
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5.0", ">= 5.0.1"
gem "uglifier", ">= 1.3.0"

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "meta_request", "~> 0.4.0"
  gem "pry-byebug"
  gem "pry-rails"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "capybara", "~> 2.13"
  gem "guard", "~> 2.14", ">= 2.14.1"
  gem "guard-minitest", "~> 2.4", ">= 2.4.6"
  gem "rubocop", ">= 0.48.1", require: false
  gem "selenium-webdriver", "~> 3.8"
  gem "shoulda-matchers", "~> 2.8"
  gem "therubyracer", "~> 0.12.3"
end

group :test do
  gem "chromedriver-helper", "~> 1.1"
  gem "minitest-focus", "~> 1.1", ">= 1.1.2"
  gem "minitest-rails-capybara", "~> 3.0", ">= 3.0.1"
  gem "minitest-reporters", "1.1.14"
  gem "rails-controller-testing", "1.0.2"
  gem "sqlite3", "~> 1.3", ">= 1.3.13"
end
