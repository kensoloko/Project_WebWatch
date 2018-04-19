source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "bcrypt", "~> 3.1", ">= 3.1.11"
gem "bootstrap-sass", "~> 3.3", ">= 3.3.7"
gem "carrierwave"
gem "coffee-rails", "~> 4.2"
gem "config", "~> 1.7"
gem "figaro", "~> 1.1", ">= 1.1.1"
gem "jbuilder", "~> 2.5"
gem "jquery-rails", "~> 4.3", ">= 4.3.1"
gem "kaminari", "~> 1.1", ">= 1.1.1"
gem "kaminari-bootstrap", "~> 3.0", ">= 3.0.1"
gem "mini_magick", "4.7.0"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.6"
gem "ransack"
gem "sass-rails", "~> 5.0"
gem "sprockets", "~> 3.7", ">= 3.7.1"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
  gem "faker"
  gem "sqlite3", "~> 1.3", ">= 1.3.11"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "rubocop", "0.47.1", require: false
end

group :production do
  gem 'pg', '~> 0.18.4'
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "font-awesome-rails", "~> 4.7", ">= 4.7.0.4"
