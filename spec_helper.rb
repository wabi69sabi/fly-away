include Rack::Test::Methods
require 'bundler'
Bundler.require
require './main.rb'
Dir.glob("./{models}/*.rb") { |file| require file }
