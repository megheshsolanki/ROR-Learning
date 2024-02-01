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
    context 'with invalid parameters' do
      let!(:invalid_param) {{user: {username: nil, password: nil, email: nil}}} 
      before do
        post '/register', params: invalid_param 
      end
      it 'return the errors' do
        expect(json['errors']).to be_an_instance_of(Array)  
      end
      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
