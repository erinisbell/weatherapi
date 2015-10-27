require 'json'
require 'httparty'


class Hurricane

  result = "http://api.wunderground.com/api/4e1235329c36d452/currenthurricane/view.json"
  url = HTTParty.get(result)
  number = url['response']['features']['currenthurricane']
  hurricane = url['currenthurricane'][0]['stormInfo']['stormName']
  category = url['currenthurricane'][0]['Current']['Category']
  puts "Here are the numbers of active hurricanes currently #{number}. The name of it is: #{hurricane} and it is a #{category}!"

end
