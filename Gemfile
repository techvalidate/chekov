source 'http://rubygems.org'
ruby   '2.0.0'

gem 'rails', '4.0.0.rc2'

gem 'coffee-rails', '~> 4.0.0'
gem 'dalli'
gem 'jquery-rails'
gem 'haml'
gem 'rails_12factor' # Heroku
gem 'sass-rails', '~> 4.0.0.rc2'
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'sqlite3'
end

# Heroku
group :production do
  gem 'memcachier'
  gem 'pg'
  gem 'unicorn'
end