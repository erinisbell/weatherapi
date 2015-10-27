require 'httparty'
require 'json'

class Wunderground
  include HTTParty

  base_uri 'api.wunderground.com'
  defult_params fields: "Geolookup, Autocomplete, astronomy, forecast10day" q: "search"
  format :json


  def self.for term
    get ("", query: {query: term})['elements']
  end
end

pp Wunderground.for "geolookup"
