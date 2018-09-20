# our source to loook for gems
source 'http://rubygems.org/'

# the sinatra dependencies
gem 'sinatra', require: 'sinatra/base'
gem 'sinatra-contrib', require: 'sinatra/reloader'

# the geokit gem which allows us to connect to the Google maps API
gem 'geokit'

# for unit testing
group :development, :test do
  gem 'rspec'
  gem 'rack-test'
  gem 'pry-byebug'
end

# JSON support
gem 'json'

# Database set up
gem 'activerecord'
gem 'sinatra-activerecord'

# additional requirements:
gem 'rake'
gem 'logger'

group :development do
  gem 'tux'
  gem 'sqlite3'
end
