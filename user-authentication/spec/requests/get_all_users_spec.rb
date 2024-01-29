require 'rails_helper'

def json
  JSON.parse(response.body)
end

RSpec.describe "Users", type: :request do
    describe 'GET /users' 
    let(:user) { FactoryBot.create(:user) }
    let(:token) { jwt_encode(user_id: user.id) }
    before do
        post '/login', params: { email: user.email, password: "password123" }
        token = json['token']
        get '/users', headers: { "Authorization" => "Bearer #{token}" }
    end
    it 'returns an ok status' do
        expect(response).to have_http_status(:ok)
    end
    it 'returns an array' do
        expect(json).to be_an_instance_of(Array)
    end
    it 'returns all the users' do
        expect(json.length).to eq(User.count)
    end

end