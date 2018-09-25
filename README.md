# Fly-Away

### About:

This is a very small Sinatra application that runs with minimal overhead and connects to the Google maps API. It takes a list of airports and creates a list of all possible connecting flights between these airports with their direct distance.

There are currently three additional, unrelated coding example in this application, which I thought were nice. They can be accessed in the navbar under 'coding'.

### Requirements:

In order to run this application you need a working ruby version of ruby 2.3.1 or above. Additionally:
- bundler version 1.16.1 or higher
- A working Google maps API key

### Installation

Pretty straight forward:

- clone the repo ``` git clone git@github.com:wabi69sabi/fly-away.git ```
- run bundler ``` cd fly-away && bundle install ``` or ``` bundle ``` (whichever you prefer)
- IMPORTANT open './app/controllers/application_controller.rb' and add your Google Maps API key (which is not free anymore...since mid June 2018) on line 5
  * ``` Geokit::Geocoders::GoogleGeocoder.api_key = '<YOUR API KEY>' ```
- setup the database ``` rake setup ```
- start the app ``` rackup -p 4567 ```
- open a browser and go to ``` 127.0.0.1:4567 ```

Alternatively, running the app can also be done by just typing:

- ``` rake ```

### Testing

RSpecs can be run with this command:

- ``` rspec ```

### Sending JSON requests

It is possible to send JSON requests to various endpoints.

A call that will return some Google maps API data is:

- ``` curl -H "Accept: application/json" --data "input=txl nyc" 127.0.0.1:4567/ports ```

This call will return an array in JSON format:

- ``` curl -H "Accept: application/json" --data "input=10,20,30,2,19,10,40,1,10,20,30,40,5,30,35,39,4,33,34,35,38" 127.0.0.1:4567/coding ```
