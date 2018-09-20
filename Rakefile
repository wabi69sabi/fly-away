require 'bundler'
Bundler.require

require 'rake'
require './main.rb'
require 'sinatra/activerecord/rake'

desc 'run the application'
task :default do
  sh 'rackup -p 4567'
end

desc 'perform unit testing'
task :test do
  sh 'rspec -I . flight_app_spec.rb'
end
