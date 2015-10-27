require 'json'
require 'httparty'


class Hurricane
  attr_accessor :name

  def self.parse hur
    obj = Hurricane.new
    obj.name = hur['response']['features']['currenthurricane']
    hurricane = url['currenthurricane'][0]['stormInfo']['stormName']
    category = url['currenthurricane'][0]['Current']['Category']
    obj
  end

end
