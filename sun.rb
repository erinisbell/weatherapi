require 'json'
require 'httparty'


class Sun


result = "http://api.wunderground.com/api/4e1235329c36d452/astronomy/q/#{code}.json"
url = HTTParty.get(result)
sunrise = url['sun_phase']['sunrise']['hour']
sunrise2 = url['sun_phase']['sunrise']['minute']
pmtime = url['sun_phase']['sunset']['hour']
pmtime2 = url['sun_phase']['sunset']['minute']
puts "The sunrise is will be at #{sunrise}:#{sunrise2} a.m. and the sunset will be at #{pmtime}:#{pmtime2}"

end
