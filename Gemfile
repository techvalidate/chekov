source 'http://rubygems.org'

gem 'rails', '3.1.0.rc8'
gem 'bluecloth'
gem 'jquery-rails'
gem 'haml'

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
  gem 'sass-rails', "~> 3.1.0.rc"
  gem 'coffee-rails', "~> 3.1.0.rc"
  gem 'uglifier'
end