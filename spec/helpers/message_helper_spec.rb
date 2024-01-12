require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the MessageHelper. For example:
#
# describe MessageHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe MessageHelper, type: :helper do
  describe "value" do
    let!(:message1) { build(:message, created_at: Time.zone.parse("2024-01-10T12:23")) }
    let!(:message2) { build(:message, created_at: Time.zone.parse("2024-04-26T05:58")) }
    it 'should show date and time' do
      expect(sent_at(message1)).to eq("12:23 10/01")
      expect(sent_at(message2)).to eq("05:58 26/04")
    end
  end
end
