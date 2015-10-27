require 'HTTParty'

class Client
  KEY = "4e1235329c36d452"

  def initialize code
    @code = code
  end

  def conditions
    result = "http://api.wunderground.com/api/#{KEY}/geolookup/conditions/q/#{@code}.json"
    url = HTTParty.get(result)
    current = url['location']['city']
    temp = url['current_observation']['temp_f']
    [current, temp]
  end

  def sun
    result = "http://api.wunderground.com/api/#{KEY}/astronomy/q/#{@code}.json"
    url = HTTParty.get(result)
    sunrise = url['sun_phase']['sunrise']['hour']
    sunrise2 = url['sun_phase']['sunrise']['minute']
    pmtime = url['sun_phase']['sunset']['hour']
    pmtime2 = url['sun_phase']['sunset']['minute']
    [sunrise, sunrise2, pmtime, pmtime2]
  end


  def alerts
    result = "http://api.wunderground.com/api/#{KEY}/alerts/q/#{@code}.json"
    url = HTTParty.get(result)
    alerts2 = url['alerts']
    [alerts2]
  end


  def hurricanes
    result = "http://api.wunderground.com/api/#{KEY}/currenthurricane/view.json"
    url = HTTParty.get(result)
    number = url['response']['features']['currenthurricane']
    hurricanes = url['currenthurricane']
    hurricanes.map do |hurricane|
      name = hurricane['stormInfo']['stormName']
      category = hurricane['Current']['Category']
      [name, category]
    end
  end



  def tendayforecast
    result = "http://api.wunderground.com/api/#{KEY}/forecast10day/q/#{@code}.json"
    url = HTTParty.get(result)
    str = []
    20.times do |i|
      day = url['forecast']['txt_forecast']['forecastday'][i]['title']
      conditions = url['forecast']['txt_forecast']['forecastday'][i]['fcttext']
      str << "Conditions for #{day}: #{conditions}" << "\n"
    end
    str
  end


end
