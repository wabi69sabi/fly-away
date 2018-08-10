require 'sinatra'
require 'geokit'
require 'erb'

Geokit::Geocoders::GoogleGeocoder.api_key = ''

get '/' do
  erb :root
end

get '/instructions' do
  erb :instructions
end

get '/instructions/:port' do
  @ports = params[:port].split(' ')
  # cleaning input
  @ports.map!{|x| x.upcase.strip}

  @h = {}
  @ports.each do |x|
    @h[:"#{x}"] = Geokit::Geocoders::GoogleGeocoder.geocode x + ", airport"
  end

  erb :flights
end

get '/index' do
  @ind = 'index of pages'
  erb :index
end
