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
    it 'should take a json payload' do
      post "/json-response", todo: { priority: 1, task: 'Get rich quick' }
      expect(last_response).to be_ok
    end
  end
end
