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

  post '/ports' do
    string = params[:input]

    begin
      @new_hash = Ports.hash_ports(string.split(' ').map!{|x| x.upcase.strip})
      @distances = Ports.get_distances(@new_hash)
      @max = @distances.max_by{|k,v| v}
    rescue
      @new_hash = 'error'
    end

    res = {'ports' => @new_hash}

    if request.accept.first.entry.include? 'json'
      res.to_json
    elsif @new_hash == 'error'
      erb :error
    else
      erb :flights
    end

  end

  get '/coding' do
    erb :coding
  end

  post '/coding' do
    if params[:input].empty?
      return "Please enter some valid params"
    end

    array = params['input'].split(',').map {|n| n.to_i}

    @res = Split.sell_coins(array)
    @split_array = Split.return_array

    res = {'result' => @res, 'array' => @split_array}

    if request.accept.first.entry.include? 'json'
      res.to_json
    else
      erb :array
    end
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
