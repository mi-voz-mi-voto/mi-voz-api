class Api::V1::UsersController < ApplicationController
  before_action :set_locale

  def create
    user = User.new(user_params)
    if !user.email.include?('@')
      render json: {error: "Error creating user. A valid email must be provided."}, status: 400
    elsif user.save
      UserMailer.registration(user).deliver_now
      render json: {success: "User created. A confirmation email has been sent to #{user.email}."}, status: 200
    else
      render json: {error: "Error creating user."}, status: 400
    end
  end

  private

  def set_locale
    I18n.locale = params[:language]
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :language, :state)
  end
end
