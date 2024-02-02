require 'rails_helper'

def json 
  JSON.parse(response.body)
end

RSpec.describe "UpdateTasks", type: :request do
  let!(:task) { FactoryBot.create(:task) }
      before do
        put "/tasks/#{task.id}", params:
                          { task:{
                            id: task.id,
                            title: task.title,
                            description: "This is the updated description"
                          }
                         }
        end
        it 'returns the correct id' do
            expect(json['id']).to eq(task.id)
        end
    
        it 'returns the title' do
            expect(json['title']).to eql(task.title)
        end
    
        it 'returns the updated description' do
            expect(json['description']).to eql("This is the updated description")
        end
        it 'returns a ok status' do
          expect(response).to have_http_status(:ok)
        end
end
