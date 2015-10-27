require 'json'
require 'httparty'



class Conditions

  def initialize
  end 

result = "http://api.wunderground.com/api/4e1235329c36d452/geolookup/conditions/q/#{code}.json"
url = HTTParty.get(result)
current = url['location']['city']
temp = url['current_observation']['temp_f']
puts "Currently the weather in #{current} is #{temp}"

end
