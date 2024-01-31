class User < ApplicationRecord
    has_secure_password
    has_many :uploads

    def uploads_with_image_url
        @user.uploads.each do |upload| 
            upload.as_json(only: [:name], methods: [:image_url])
        end
    end
end
