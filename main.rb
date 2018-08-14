require 'erb'

Geokit::Geocoders::GoogleGeocoder.api_key = ''

class App < Sinatra::Base

  configure do
    # you can also have dynamic settings with blocks
    set(:css_dir) { File.join(views, 'css') }
  end

  configure :development do
    register Sinatra::Reloader
  end

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

end
