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
  end

  get '/coding' do
    erb :coding
  end

  post '/coding' do
    array = params['input'].split(',').map {|n| n.to_i}

    def sell_coins(input)
      a = split_em(input)
      o = [a.first]

      until o.flatten.last == input.last
        a = split_em(a.last)
        o << a.first
      end

      # just to see the created split array uncomment next line
      @split_array = o
      return_max(o)
    end

    def split_em(array)
      array.slice_after(array.max).to_a
    end

    def return_max(totals)
      res = []
      totals.each {|a| res << a.max - a.min}
      return res.max
    end

    @res = sell_coins(array)

    erb :array
  end

  get '/index' do
    @ind = 'index of pages'
    erb :index
  end

  post '/json-response' do
    request.params.to_json
  end

  get '/json/:ports' do
    params.to_json
  end
end
