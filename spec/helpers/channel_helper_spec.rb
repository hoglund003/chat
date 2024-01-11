require 'rails_helper'
RSpec.describe ChannelHelper, type: :helper do
  let(:user) { create(:user) }
  let(:channel) { create(:channel) }
  let(:message1) { create(:message, channel: channel) }
  let(:message2) { create(:message, channel: channel) }
  describe "notifications_count" do
    it 'should be 2' do
      create(:unread_notification, message: message1, user: user)
      create(:unread_notification, message: message2, user: user)
      expect(notifications_count(user, channel)).to eq(2)

      create(:unread_notification, message: message2, user: user)
      expect(notifications_count(user, channel)).to eq(3)
    end
  end
end
