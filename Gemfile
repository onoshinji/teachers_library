source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'
gem 'mysql2'
gem 'ransack'
gem 'draper'
gem 'font-awesome-rails'
# aws-sdkは使わなくなった
gem 'rubocop', require: false
gem 'aws-sdk'
gem 'foreman'
gem 'webpacker'
gem 'unicorn' # アプリケーションサーバのunicorn
gem 'mini_racer', platforms: :ruby # デプロイ時に必要
gem 'ed25519'
gem 'bcrypt_pbkdf'
gem 'kaminari'
gem 'rails_admin', '~> 2.0' #管理者画面作成
gem 'cancancan'
gem 'devise'
gem 'devise-i18n'
gem 'carrierwave'
gem 'mini_magick'
gem 'fog-aws'
gem 'rails', '~> 5.2.4'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'dotenv-rails'


group :development, :test do
  gem 'letter_opener_web'
  gem 'capistrano', '3.6.0' # capistranoのツール一式
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'spring'
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'launchy'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
