require 'rails_helper'

def json
  JSON.parse(response.body)
end

RSpec.describe "Users", type: :request do
  describe "post /register" do
    context 'with valid parameters' do
      let!(:user) {FactoryBot.build(:user)}
      before do
        post '/register', params: {
            username: user.username,
            email: user.email,
            password: user.password
        }
      end
      it 'returns the username' do
        expect(json['username']).to eq(user.username)  
      end
      it 'returns the email' do
        expect(json['email']).to eq(user.email)  
      end
      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end
  end
end
