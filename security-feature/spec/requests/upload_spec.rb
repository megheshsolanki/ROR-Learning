require 'rails_helper'
def json 
  JSON.parse(response.body)
end

RSpec.describe "Upload", type: :request do
  describe "post /upload" do
    let(:user) {FactoryBot.create(:user)}
    let(:token) { jwt_encode(user_id: user.id) }
    let(:image) {FactoryBot.create(:upload)}
    before do 
      post '/login', params: {
        email: user.email,
        password: user.password
      }
      token = json['token']
      post '/upload',params:{
        name: image.name,
        image: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, 'spec', 'images', 'image.png')), 'image/png')
      }, headers: { "Authorization" => "Bearer #{token}" }
    end
    it "should be an array of uploaded files" do 
      expect(json).to be_an_instance_of(Array)  
    end
    it "should return ok status code" do
      expect(response).to have_http_status(:created)  
    end
  end
end

