require 'rails_helper'

def json
  JSON.parse(response.body)
end

RSpec.describe "Users", type: :request do
    describe 'post /login' do
        context "valid paramas" do 
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
        context "invalid params" do 
            let(:user) {FactoryBot.create(:user,password: "password")}
            before do 
                post '/login', params: {
                    email: user.email,
                    password: "password12"
                }
            end
            
            it 'returns a error' do
                expect(json['error']).to be_present
            end
    
            it 'returns unauthorized status' do
                expect(response).to have_http_status(:unauthorized)
            end
        end
    end
end
