
require 'json'
require 'httparty'
require 'pry'
 #weather key id: 4e1235329c36d452

puts "What zipcode would you like to get the weather for?"
code = gets.chomp.to_i
# result = "http://api.wunderground.com/api/4e1235329c36d452/forecast10day/q/#{code}.json"
# url = HTTParty.get(result)
# 10.times do |i|
# day = url['forecast']['txt_forecast']['forecastday'][i]['title']
# conditions = url['forecast']['txt_forecast']['forecastday'][i]['fcttext']
# puts "Conditions for #{day}: #{conditions}"
# end


# result = "http://api.wunderground.com/api/4e1235329c36d452/geolookup/conditions/q/#{code}.json"
# url = HTTParty.get(result)
# current = url['location']['city']
# temp = url['current_observation']['temp_f']
# puts "Currently the weather in #{current} is #{temp}"


result = "http://api.wunderground.com/api/4e1235329c36d452/astronomy/q/#{code}.json"
url = HTTParty.get(result)
sunrise = url['sun_phase']['sunrise']['hour']
sunrise2 = url['sun_phase']['sunrise']['minute']
pmtime = url['sun_phase']['sunset']['hour']
pmtime2 = url['sun_phase']['sunset']['minute']
#sunrise.each_key {|key, value| puts "The sunrise is at #{key}#{value}"}
puts "The sunrise is will be at #{sunrise}:#{sunrise2} a.m. and the sunset will be at #{pmtime}:#{pmtime2} p.m."


# result = "http://api.wunderground.com/api/4e1235329c36d452/astronomy/q/#{code}.json"
# url = HTTParty.get(result)
# alerts = url['response']['features']['alerts']
# puts "Here are the current alerts #{alerts} for #{code}"









# puts "What Feature would you like to get for the location? (Sunrise, Current, Hurricane, or Forecast)"
# feature = gets.chomp
#
# feature = {
#    "Sunrise" => "astronomy",
#    "Current" => "conditions",
#    "Hurricane" => "currenthurricane",
#    "Forecast" => "forecast10day"
#  }
