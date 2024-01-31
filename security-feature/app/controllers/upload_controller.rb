class UploadController < ApplicationController
    def create
        @user = User.find(@current_user.id)
        @upload = @user.uploads.create(upload_params)
        render json: @user.uploads ,status: :created
    end

    private 
    def upload_params 
        params.permit(:name, :image)
    end
end