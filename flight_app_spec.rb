require 'rack/test'
require 'spec_helper'

describe 'Sinatra App' do
  let(:app) { App.new }

  context "GET to /" do
    it "displays home page" do
      get '/'
      expect(last_response.body).to include("wabisabisf@gmail.com")
    end
  end

  context "GET to /instructions" do
    it "displays instructions with a list of airport codes" do
      get '/instructions'
      expect(last_response.body).to include("US airport codes")
    end
  end

  context "Accepts JSON requests" do
    it "should take a json payload" do
      post "/json-response", todo: { priority: 1, task: 'Get rich quick' }
      expect(last_response).to be_ok
    end
  end

  context "Calculates the largest distance between min and max values in split array" do
    it "should return the correct values in a hash" do
      headers = { "HTTP_ACCEPT" => "application/json" }
      post "/coding", { input: '10,20,30,2,19,10,40,1,10,20,30'}, headers
      expect(last_response.body).to eq('{"result":38,"array":[[10,20,30,2,19,10,40],[1,10,20,30]]}')
    end
  end
end
