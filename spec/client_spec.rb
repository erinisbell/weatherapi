require 'spec_helper'

RSpec.describe WeatherPI do

  describe "#input" do
    client = Client.new
    it "takes a user zipcode" do
      expect(client.code).to be_integer
    end
  end
end

end
