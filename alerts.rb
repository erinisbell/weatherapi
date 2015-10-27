require 'json'
require 'httparty'


class Alerts
  
  result = "http://api.wunderground.com/api/4e1235329c36d452/astronomy/q/#{code}.json"
  url = HTTParty.get(result)
  alerts = url['query_zone']
  alerts2 = url['alerts']
  puts "Here are the current alerts for #{code}: #{alerts} #{alerts2} if empty, there are no alerts for your area. "

end
