class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    user = User.all.order(created_at: :desc)
    render json: user
  end

  def create
    # @check_user = User.where("email_address= ?",params[:email_address]).first
    # if(@check_user !=nil)
    #   render json: "This userexists"
    #   return
    # end
    begin
      user = User.new
      user = User.create!(user_params)
      puts(user_params[:courses][:subject])
      if (register_alerts(user_params[:courses][:subject], user_params[:courses][:course_name], user_params[:courses][:section], user_params[:phone_number]))
        render json: user
      else
        user.destry()
        render json: "some error"
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: e
    rescue Exception => e
      render json: e
    rescue
      render json: "some error"
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
    params.require(:user).permit(:name, :email_address, :password ,:phone_number, :string, :password_confirmation, courses: [:subject, :course_name, :section])
  end
  def register_alerts(subject, course_name, section, number)
    course =  CourseNotificaiton.find_by(subject: subject, course_name: course_name, section: section)
    if course
      course.phonenumbers << "," <<number
      return course.save
    else
      course = CourseNotificaiton.new
      course.subject = subject 
      course.course_name = course_name 
      course.section = section
      course.phonenumbers = number
      return course.save
    end
  end
end
