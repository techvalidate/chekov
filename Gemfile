source 'http://rubygems.org'

gem 'rails', '3.2.13'
gem 'jquery-rails'
gem 'haml'
gem 'newrelic_rpm'

group :development, :test do
  gem 'sqlite3'
end

group :test do
  gem 'turn', require: false
end

# Heroku
group :production do
  gem 'pg'
  gem 'thin'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end