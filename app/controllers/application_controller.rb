require 'erb'
require 'logger'

Geokit::Geocoders::GoogleGeocoder.api_key = ''

class ApplicationController < Sinatra::Base

  configure do
    set :public_dir, "public"
    set :views, "app/views"
  end

  configure :development do
    register Sinatra::Reloader
    $logger = Logger.new(STDOUT)
    set :database_file, 'config/database.yml'
    set :database, 'sqlite3:db/database.db'
  end

  get '/' do
    Request.log_this_request(env)
    erb :root
  end

  get '/instructions' do
    Request.log_this_request(env)
    erb :instructions
  end

  post '/ports' do
    Request.log_this_request(env) unless env['HTTP_USER_AGENT'].nil?
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
    Request.log_this_request(env)
    erb :coding
  end

  post '/coding' do
    Request.log_this_request(env) unless env['HTTP_USER_AGENT'].nil?
    if params[:input].empty?
      return "Please enter some valid params"
    end

    array = params['input'].split(',').map {|n| n.to_i}

    bench = Benchmark.measure do
      @res = Split.sell_coins(array)
    end

    @split_array = Split.return_array

    if params[:benchmark] == 'on'
      @benchmark = bench
      @alternative = Benchmark.measure {FastArray.get_highest_value(array)}
    end

    res = {'result' => @res, 'array' => @split_array}

    if request.accept.first.entry.include? 'json'
      res.to_json
    else
      erb :array
    end
  end

  get '/queries' do
    Request.log_this_request(env)
    Query.create(input: params[:input]) unless params[:input].nil?
    begin
      Query.destroy(params[:delete]) unless params[:delete].nil?
    rescue
      return 'bad ID'
    end
    @queries = Query.all
    erb :queries
  end

  get '/index' do
    Request.log_this_request(env)
    @ind = 'index of pages'
    erb :index
  end

  post '/json-response' do
    request.params.to_json
  end

  get '/json/:ports' do
    params[:ports].split(' ').map! {|p| p + ' airport'}.to_json
  end

  get '/logs' do
    Request.log_this_request(env)
    erb :logs
  end

  post '/logs' do
    ManualLog.delete_all
    Request.log_this_request(env)
    redirect '/logs'
  end

  get '/spiral' do
    erb :spiral
  end

  post '/spiral' do
    array = params[:matrix].split(',').map! {|i| i.to_i}

    if array.count % 3 == 0
      matrix = array.each_slice(3).to_a
    else
      return 'input array has to be divisible by 3'
    end

    SpiralMatrix.spiral(matrix).to_json
  end
end
