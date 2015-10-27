require 'json'
require 'httparty'


class TenDay

def initialize code
  @code = code
end


result = "http://api.wunderground.com/api/4e1235329c36d452/forecast10day/q/#{code}.json"
url = HTTParty.get(result)
10.times do |i|
day = url['forecast']['txt_forecast']['forecastday'][i]['title']
conditions = url['forecast']['txt_forecast']['forecastday'][i]['fcttext']
puts "Conditions for #{day}: #{conditions}"
end

end
