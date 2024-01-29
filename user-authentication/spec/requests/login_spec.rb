require 'rails_helper'

def json
  JSON.parse(response.body)
end

RSpec.describe "Users", type: :request do
    describe 'post /login'
    let(:user) {FactoryBot.create(:user,password: "password")}
    before do 
        post '/login', params: {
            email: user.email,
            password: "password"
        }
    end
    
    it 'returns a token' do
         expect(json['token']).to be_present
    end

    it 'returns an ok status' do
        expect(response).to have_http_status(:ok)
    end
end
