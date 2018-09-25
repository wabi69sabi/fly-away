require 'bundler'
Bundler.require

require 'rake'
require 'sinatra/activerecord/rake'

desc 'run the application'
task :default do
  sh 'rackup -p 4567'
end

desc 'perform unit testing'
task :test do
  sh 'rspec'
end

desc 'all db steps in one'
task :setup do
  sh 'rake db:drop'
  sh 'rake db:create'
  sh 'rake db:migrate'
end
