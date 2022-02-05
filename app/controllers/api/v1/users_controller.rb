class Api::V1::UsersController < ApplicationController
  
  def create
    user = User.new(user_params)
    if !user.email.include?('@')
      render json: {error: "Error creating user. A valid email must be provided."}, status: 400
    elsif user.save
      UserMailer.registration(user).deliver_now
      render json: {success: "User created. A confirmation email has been sent to the user."}, status: 200
    else
      render json: {error: "Error creating user."}, status: 400
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :language, :state, :postal_code)
  end
end
