require 'erb'

Geokit::Geocoders::GoogleGeocoder.api_key = ''

class App < Sinatra::Base

  configure do
    # redundant as this is the default, done for demonstration
    set(:css_dir) { File.join(root, 'public') }
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

  post '/json-response' do
    request.params.to_json
  end
end
