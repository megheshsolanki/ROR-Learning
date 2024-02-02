require 'rails_helper'

def json
    JSON.parse(response.body)
end

RSpec.describe 'DeleteTask', type: :request do
    describe 'DELETE /tasks/:id' do
        let!(:task) { FactoryBot.create(:task) }

        before do
        delete "/tasks/#{task.id}"
        end

        it 'returns status code 204' do
        expect(response).to have_http_status(:no_content)
        end
    end
end