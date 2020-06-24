class Api::V1::SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email_address: params[:email_address])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: {
        status: :created, 
        logged_in: true, 
        user: user
      }
    else
     render json: {status: 401}
    end
  end
  def destroy
    session[:user_id] = nil
    render json: {
      status: "Session destroyed", 
      logged_in: false
    }
  end
  def user_params
    params.permit(:email_address, :password)
  end
end
