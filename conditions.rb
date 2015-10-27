require 'json'
require 'httparty'



class Conditions



  def self.parse current
    obj = Conditons.new
    obj.name = current['location']['city']
    temp = url['current_observation']['temp_f']
  end



end
