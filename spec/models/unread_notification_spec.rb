require 'rails_helper'

RSpec.describe UnreadNotification, type: :model do
  let(:unread_notification) { create(:unread_notification) }
  it "should have user" do
    expect(unread_notification.user).to be_a(User)
  end

  it "should have message" do
    expect(unread_notification.message).to be_a(Message)
  end

  it "should have channel" do
    expect(unread_notification.channel).to be_a(Channel)
  end
end
