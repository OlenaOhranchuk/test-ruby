source 'https://rubygems.org'
ruby '2.4.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'

gem 'activeadmin', '~> 1.4.3'
gem 'aws-sdk-s3', '~> 1', require: false
gem 'bootsnap', '~> 1.3.0'
gem 'devise', '>= 4.6.0'
gem 'devise_token_auth', '~> 1.0.0'
gem 'draper', '~> 3.0.0'
gem 'figaro', '~> 1.1.1'
gem 'haml-rails', '~> 1.0.0'
gem 'jbuilder', '~> 2.7.0'
gem 'oj', '~> 2.17.5'
gem 'pg', '~> 0.18.2'
gem 'puma', '~> 3.0'
gem 'pundit', '~> 2.0.1'
gem 'rack-cors', '~> 0.4.0'
gem 'rspec_api_documentation', '~> 6.1.0'
gem 'sidekiq', '~> 5.2.5'
gem 'ffi', '>= 1.9.24'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'
gem 'redis-rails', '~> 5.0.2'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# User Authentication with Facebook
gem 'omniauth-facebook'

# User Authentication with Google
gem 'omniauth-google-oauth2'

# Install sudo apt-get install imagemagick libmagickwand-dev
gem 'rmagick'
gem 'fog-aws'
gem 'jquery-fileupload-rails'

# Frontend
gem 'bootstrap', '~> 4.0.0'
gem 'jquery-rails', '~> 4.3'
gem 'bootstrap-slider-rails'
gem 'select2-rails'
gem 'ejs'

# Share by social network
gem 'social-share-button'

# Sentry
gem 'sentry-raven'

group :development, :test do
  gem 'bullet', '~> 5.7.5'
  gem 'factory_bot_rails', '~> 4.8.2'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.8.0'
end

group :development do
  gem 'annotate', '~> 2.6.5'
  gem 'better_errors', '~> 2.1.1'
  gem 'binding_of_caller', '~> 0.7.2'
  gem 'brakeman', '~> 4.3.1'
  gem 'letter_opener', '~> 1.4.1'
  gem 'listen', '~> 3.0.5'
  gem 'rubocop', '~> 0.49.1'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'faker', '~> 1.7.3'
  gem 'shoulda-matchers', '~> 3.1.1'
  gem 'simplecov', '~> 0.13.0', require: false
end

group :assets do
  gem 'uglifier', '~> 2.7.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
