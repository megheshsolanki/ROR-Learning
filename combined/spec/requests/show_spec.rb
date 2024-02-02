require 'rails_helper'

def json 
  JSON.parse(response.body)
end

RSpec.describe "Show", type: :request do
  describe "get /user" do
    let(:user) { FactoryBot.create(:user, password: "password123") }
    let(:token) { jwt_encode(user_id: user.id) }
    before do
        post '/login', params: { email: user.email, password: "password123" }
        token = json['token']
        get '/user', headers: { "Authorization" => "Bearer #{token}" }
    end
    it "should return a status code ok" do
      expect(response).to have_http_status(:ok) 
    end
    it "should return the logged in user" do
      expect(json['email']).to eq(user.email) 
    end
    
  end
end
