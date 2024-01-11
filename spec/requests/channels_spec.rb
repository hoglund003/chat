require 'rails_helper'

RSpec.describe "Channels", type: :request do
  let(:user) { create(:user) }
  before do
    login_as(user, scope: :user)
    create(:channel)
  end
  describe "POST /channels" do

    context 'with valid parameters' do
      let(:valid_attributes) { { channel: { name: 'Tech Talks' } } }

      it 'creates a new Channel' do
        expect {
          post '/channels', params: valid_attributes
        }.to change(Channel, :count).by(1)
      end

      it 'returns a created status' do
        post '/channels', params: valid_attributes
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) { { channel: { name: '' } } }

      it 'does not create a new Channel' do
        expect {
          post '/channels', params: invalid_attributes
        }.to_not change(Channel, :count)
      end

      it 'returns an unprocessable entity status' do
        post '/channels', params: invalid_attributes
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "GET /channels/:id" do
    let(:message) { create(:message) }
    it 'should clear notification' do
      create(:unread_notification, message: message, user: user)
      expect {
        get channel_path(message.channel)
      }.to change(UnreadNotification, :count)
    end
  end
end
