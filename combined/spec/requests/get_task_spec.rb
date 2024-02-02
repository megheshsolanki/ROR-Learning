require 'rails_helper'

def json
  JSON.parse(response.body)
end

RSpec.describe "GetTasks", type: :request do
  describe "GET /tasks/:id" do
    let!(:task) { FactoryBot.create(:task) } 
    before do 
      get "/tasks/#{task.id}"
    end
    it 'returns the correct id' do
      expect(json['id']).to eq(task.id)
    end

    it 'returns the correct title' do
      expect(json['title']).to eql(task.title)
    end

    it 'returns the correct description' do
      expect(json['description']).to eql(task.description)
    end

    it 'returns a ok status' do
        expect(response).to have_http_status(:ok)
      end
  end
end
