class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    user = User.all.order(created_at: :desc)
    render json: user
  end

  def create
    @check_user = User.where("email_address= ?",params[:email_address]).first
    if(@check_user !=nil)
      render json: "This userexists"
      return
    end
    user = User.create!(user_params)
    if user
      render json: user
    else
      render json: user.errors
    end
  end

  def show
  end

  def destry
    user&.destry
    render json: {message: "user deleted"}
  end

  def user
    @user ||= User.find(params[:id])
  end
  private
  def user_params
    params.permit(:name, :courses, :email_address, :password, :phone_number, :string, :user)
  end
end
