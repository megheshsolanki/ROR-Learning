class UserController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  before_action :set_user, only: [:show]
  def create
    @user = User.new(user_params)
    if @user.save 
      render json: @user, status: :created
    else 
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  def show 
    render json: @user, status: :ok
  end
  private 
  def set_user
    @user = User.find(@current_user.id)
  end
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
