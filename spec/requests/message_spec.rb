require 'rails_helper'

RSpec.describe "Messages", type: :request do
  let(:user) { create(:user) }
  before do
    login_as(user, scope: :user)
  end
  describe "POST /create" do
    let(:channel) { create(:channel) }
    let(:invalid_attributes) { { message: { channel_id: channel.id, text: "" } } }
    let(:valid_attributes) { { message: { channel_id: channel.id, text: "Valid text" } } }

    it 'should not create invalid message' do
      expect {
        post '/messages', params: invalid_attributes
      }.to change(Message, :count).by(0)
    end

    it 'should set notifications' do
      create(:user)
      create(:user)

      expect {
        post '/messages', params: valid_attributes
      }.to change(UnreadNotification, :count).by(2)
    end
  end
end
