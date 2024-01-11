require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "POST /" do
    let(:invalid_attributes) { { user: { nickname: "", email: "test.user@email.test", password: "password", password_confirmation: "password" } } }

    it 'should not create invalid message' do
      expect {
        post '/users', params: invalid_attributes
      }.to change(User, :count).by(0)
    end
  end
end
