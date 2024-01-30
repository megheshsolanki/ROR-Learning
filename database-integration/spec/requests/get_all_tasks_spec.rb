require 'rails_helper'

RSpec.describe "GetAllTasks", type: :request do
  describe "GET /tasks" do
    before do
      FactoryBot.create_list(:task,5)
      get '/tasks'
    end

    it 'returns an array' do
      expect(json).to be_instance_of(Array)
    end
    it 'returns all articles' do
      expect(json.size).to eq(5)
    end

    it 'returns status code 201' do
      expect(response).to have_http_status(:ok)
    end
  end
end
