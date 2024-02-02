class UploadController < ApplicationController
    def create
        @user = @current_user
        @upload = @user.uploads.create(upload_params)
        render json: @user.uploads ,status: :created
    end
    def show 
        @user = @current_user
        @uploads = @user.uploads 
        render json: @uploads, status: :ok 
    end

    private 
    def upload_params 
        params.permit(:name, :image)
    end
end