require 'rails_helper'

RSpec.describe "GetWeathers", type: :request do
  describe "GET /weather/:city" do
    let(:city){"mumbai"}

    before do
      get "/weather/#{city}"
    end
    it "should return a status ok" do
      expect(response).to have_http_status(:ok) 
    end
    it "should return weather object" do 
      expect(response.body).to include('weather')
    end
  end
end
