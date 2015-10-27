require 'spec_helper'
require './client'

RSpec.describe "Client" do

  describe "#input" do
    code = 37206
    client = Client.new(code)
    it "takes a user code" do
      expect(code).to be_integer
    end
  end
end
