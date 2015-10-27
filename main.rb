
require 'json'
require 'httparty'
require 'pry'
require './ten_day'
require './conditons'
 #weather key id: 4e1235329c36d452

class WeatherCLI
  include HTTParty
  #base_uri 'weatherapi.herokuapp.com'

puts "What zipcode would you like to get the weather for?"
code = gets.chomp.to_i



end
