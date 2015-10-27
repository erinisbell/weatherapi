require './weather'
require 'json'
require 'HTTParty'
#weather key id: 4e1235329c36d452



#base_uri 'weatherapi.herokuapp.com'

puts "What zipcode would you like to get the weather for?"
CODE = gets.chomp.to_i
KEY = "4e1235329c36d452"


result = "http://api.wunderground.com/api/#{KEY}/forecast10day/q/#{CODE}.json"
url = HTTParty.get(result)
20.times do |i|
day = url['forecast']['txt_forecast']['forecastday'][i]['title']
conditions = url['forecast']['txt_forecast']['forecastday'][i]['fcttext']
puts "Conditions for #{day}: #{conditions}"
end



def conditions
  result = "http://api.wunderground.com/api/#{KEY}/geolookup/conditions/q/#{CODE}.json"
  url = HTTParty.get(result)
  current = url['location']['city']
  temp = url['current_observation']['temp_f']
  @conditions = "Currently the weather in #{current} is #{temp}"
end
puts conditions


def sun
  result = "http://api.wunderground.com/api/#{KEY}/astronomy/q/#{CODE}.json"
  url = HTTParty.get(result)
  sunrise = url['sun_phase']['sunrise']['hour']
  sunrise2 = url['sun_phase']['sunrise']['minute']
  pmtime = url['sun_phase']['sunset']['hour']
  pmtime2 = url['sun_phase']['sunset']['minute']
  @sun = "The sunrise is will be at #{sunrise}:#{sunrise2} a.m. and the sunset will be at #{pmtime}:#{pmtime2}"
end
puts sun

def alerts
  result = "http://api.wunderground.com/api/#{KEY}/alerts/q/#{CODE}.json"
  url = HTTParty.get(result)
  alerts = url['query_zone']
  alerts2 = url['alerts']
  @alerts = "Here are the current alerts for #{CODE}: #{alerts} #{alerts2} if empty, there are no alerts for your area. "
end
puts alerts


def hurricane
  result = "http://api.wunderground.com/api/#{KEY}/currenthurricane/view.json"
  url = HTTParty.get(result)
  number = url['response']['features']['currenthurricane']
  hurricane = url['currenthurricane'][0]['stormInfo']['stormName']
  category = url['currenthurricane'][0]['Current']['Category']
  @hurricane = "Here are the numbers of active hurricanes currently #{number}. The name of it is: #{hurricane} and it is a #{category}!"
end
puts hurricane
