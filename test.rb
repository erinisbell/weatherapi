require 'httparty'
require 'pp'

class Wunderground
  include HTTParty

  base_uri 'http://api.wunderground.com/api/4e1235329c36d452/q.json'
  defult_params fields: "Geolookup, Autocomplete, astronomy, forecast10day" q: "search"
  format :json


  def self.for term
    get ("", query: {query: term})['elements']
  end
end

pp Wunderground.for "geolookup"
