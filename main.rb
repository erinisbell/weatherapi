
require 'json'
require 'httparty'
require 'pry'
 #weather key id: 4e1235329c36d452

puts "What zipcode would you like to get the weather for?"
code = gets.chomp.to_i
result = "http://api.wunderground.com/api/4e1235329c36d452/forecast10day/q/#{code}.json"
url = HTTParty.get(result)
10.times do |i|
day = url['forecast']['txt_forecast']['forecastday'][i]['title']
conditions = url['forecast']['txt_forecast']['forecastday'][i]['fcttext']
puts "Conditions for #{day}: #{conditions}"
end


result = "http://api.wunderground.com/api/4e1235329c36d452/geolookup/conditions/q/#{code}.json"
url = HTTParty.get(result)
current = url['location']['city']
temp = url['current_observation']['temp_f']
puts "Currently the weather in #{current} is #{temp}"


result = "http://api.wunderground.com/api/4e1235329c36d452/astronomy/q/#{code}.json"
url = HTTParty.get(result)
sunrise = url['sun_phase']['sunrise']['hour']
sunrise2 = url['sun_phase']['sunrise']['minute']
pmtime = url['sun_phase']['sunset']['hour']
pmtime2 = url['sun_phase']['sunset']['minute']
puts "The sunrise is will be at #{sunrise}:#{sunrise2} a.m. and the sunset will be at #{pmtime}:#{pmtime2}"


result = "http://api.wunderground.com/api/4e1235329c36d452/astronomy/q/#{code}.json"
url = HTTParty.get(result)
alerts = url['query_zone']
alerts2 = url['alerts']
puts "Here are the current alerts for #{code}: #{alerts} #{alerts2} if empty, there are no alerts for your area. "



result = "http://api.wunderground.com/api/4e1235329c36d452/currenthurricane/view.json"
url = HTTParty.get(result)
number = url['response']['features']['currenthurricane']
hurricane = url['currenthurricane'][0]['stormInfo']['stormName']
category = url['currenthurricane'][0]['Current']['Category']
puts "Here are THE NUMBERS OF HURRICANES ANYWHERE KURT: #{number}. The name of it is: #{hurricane} and it is a #{category}!"






# puts "What Feature would you like to get for the location? (Sunrise, Current, Hurricane, or Forecast)"
# feature = gets.chomp
#
# feature = {
#    "Sunrise" => "astronomy",
#    "Current" => "conditions",
#    "Hurricane" => "currenthurricane",
#    "Forecast" => "forecast10day"
#  }
