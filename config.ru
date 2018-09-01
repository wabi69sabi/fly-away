require 'bundler'
Bundler.require
# we are going to add more file structure in here
Dir.glob("./{models}/*.rb") { |file| require file }
require './main'

run App
