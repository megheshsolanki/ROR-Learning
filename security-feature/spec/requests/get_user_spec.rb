require 'rails_helper'
def json 
  JSON.parse(response.body)
end

RSpec.describe "GetAllUploads", type: :request do
  describe "GET /show" do
    context "valid params" do
      let(:user) {FactoryBot.create(:user)}
      let(:token) { jwt_encode(user_id: user.id) }
      before do 
        FactoryBot.create_list(:upload,10,user: user)
        post '/login', params: {
          email: user.email,
          password: user.password
        }
        token = json['token']
        get '/show', headers: { "Authorization" => "Bearer #{token}" }
      end
      it "should return ok status code" do
        expect(response).to have_http_status(:ok)  
      end
      it "should return array of uploaded files" do 
        expect(json['uploads'].size).to  eq(10)
      end
    end
    context "missing token" do
      before do 
        get '/show'
      end
      it "should return unauthorized status code" do
        expect(response).to have_http_status(:unauthorized)  
      end
      it "should return error" do 
        expect(json['error']).to  be_present
      end
    end
  end
end
