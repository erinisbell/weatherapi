require 'open-uri'
require 'json'
require 'httparty'
 #weather key id: 4e1235329c36d452

puts "What zipcode would you like to get the weather for?"
code = gets.chomp.to_i
puts "What Feature would you like to get for the location"

# feature = {
#   "astronomy" => "astronomy",
#   "conditions" => "conditions",
#   "currenthurricane" => "currenthurricane",
#   "forecast10day" => "forecast10day",
# }




open("http://api.wunderground.com/api/4e1235329c36d452/geolookup/forecast10day/conditions/q/IA/#{code}.json") do |f|
  json_string = f.read
  parsed_json = JSON.parse(json_string)
  location = parsed_json['location']['city']
  temp_f = parsed_json['current_observation']['temp_f']
  print "Current temperature in #{location} is: #{temp_f}\n"
end
