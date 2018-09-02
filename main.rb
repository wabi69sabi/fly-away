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
      begin
        @h[:"#{x}"] = Geokit::Geocoders::GoogleGeocoder.geocode x + ", airport"
      rescue
        return erb :error
      end
    end

    erb :flights

    res = {'ports' => @h}
    for_json = res.to_json
  end

  get '/coding' do
    erb :coding
  end

  post '/coding' do
    array = params['input'].split(',').map {|n| n.to_i}

    @res = Split.sell_coins(array)
    @split_array = Split.return_array

    erb :array

    # res = {'result' => @res, 'array' => @split_array}
    # for_json = res.to_json
  end

  get '/index' do
    @ind = 'index of pages'
    erb :index
  end

  post '/json-response' do
    request.params.to_json
  end

  get '/json/:ports' do
    params[:ports].split(' ').map! {|p| p + ' airport'}.to_json
  end
end
