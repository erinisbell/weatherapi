
require 'json'
require 'httparty'
require 'pry'
 #weather key id: 4e1235329c36d452

puts "What zipcode would you like to get the weather for?"
code = gets.chomp.to_i
puts "What Feature would you like to get for the location? (Sunrise, Current, Hurricane, or Forecast)"
feature = gets.chomp

feature = {
   "Sunrise" => "astronomy",
   "Current" => "conditions",
   "Hurricane" => "currenthurricane",
   "Forecast" => "forecast10day"
 }


url = "http://api.wunderground.com/api/4e1235329c36d452/conditions/q/CA/#{code}.json"
result = HTTParty.get(url).parse

puts result
