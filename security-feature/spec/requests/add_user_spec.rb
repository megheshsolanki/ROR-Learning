require 'rails_helper'

def json 
    JSON.parse(response.body)
end

RSpec.describe "AddUser", type: :request do
    describe "POST /register" do
        context "valid params" do
            let(:user) { FactoryBot.build(:user,password: "password") }
            before do 
                post '/register', params: {
                    user:{
                        email: user.email,
                        password: "password"
                    }
                }
            end
            it "should return the user with correct email" do 
                expect(json['email']).to eq(user.email)  
            end
            it "should return the user with uploads" do 
                expect(json['uploads']).to be_an_instance_of(Array)  
            end
            it "should return created status" do  
                expect(response).to have_http_status(:created)
            end
        end 
        context "invalid params" do 
            before do 
                post '/register', params: {
                    user:{
                        email: nil,
                        password: nil
                    }
                }
            end
            it "should have errors array" do 
                expect(json['errors']).to be_an_instance_of(Array)  
            end
            it "should return status of unprocessable entity" do 
                expect(response).to have_http_status(:unprocessable_entity) 
            end
        end
    end
end