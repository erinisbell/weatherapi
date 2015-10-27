require 'spec_helper'
require './client'

RSpec.describe "Client" do
let(:code) {37206}

  describe "#input" do

    client = Client.new(:code)
    it "takes a user code" do
      expect(code).to be_integer
    end
  end


#   describe "#output" do
#     output = temperature
#     client = Client.new(output)
#     it "outputs json format" do
#     expect(output).to :format => :json
#   end
# end

end
