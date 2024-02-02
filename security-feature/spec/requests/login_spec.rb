require 'rails_helper'

def json 
    JSON.parse(response.body)
end

RSpec.describe "Login User", type: :request do 
    describe "POST /login" do
        context "valid paramas" do 
            let(:user) { FactoryBot.create(:user,password: "1234") }
            before do 
                post '/login', params:{
                    email: user.email,
                    password: "1234"
                }
            end
            it "should return the token" do 
                expect(json['token']).to be_present 
            end
            it "should return ok status code" do 
                expect(response).to have_http_status(:ok) 
            end
        end
        context "valid paramas" do 
            let(:user) { FactoryBot.create(:user,password: "1234") }
            before do 
                post '/login', params:{
                    email: user.email,
                    password: "12345"
                }
            end
            it "should return error" do 
                expect(json["error"]).to be_present 
            end
            it "should return unauthorized status code" do 
                expect(response).to have_http_status(:unauthorized) 
            end
        end
    end
end