FactoryBot.define do
    factory :upload do
        association :user

        name { Faker::Lorem.sentence }
        image {Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, 'spec', 'images', 'image.png')), 'image/png')}
    end
  end