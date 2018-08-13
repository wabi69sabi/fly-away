require 'rack/test'
require 'spec_helper'
require 'pry-byebug'

describe 'Sinatra App' do
  let(:app) { App.new }

  context "GET to /" do
    it "displays home page" do
      get '/'
      expect(last_response.body).to include("wabisabisf@gmail.com")
    end
  end
end
