require 'rails_helper'
def json
  JSON.parse(response.body)
end

RSpec.describe "AddTasks", type: :request do
  describe "post /tasks" do
    let!(:param) { FactoryBot.create(:task) }
     before do 
      post '/tasks', params: {
        task:{
          title: param.title,
          description: param.description
        }

      }
     end
     it 'return the created task with correct title' do
      expect(json['title']).to eq(param.title) 
     end
     it 'return the created task with correct description' do
      expect(json['description']).to eq(param.description) 
     end
     it 'return created status code' do
      expect(response).to have_http_status(:created) 
     end

  end
end
