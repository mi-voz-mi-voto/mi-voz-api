class Api::V1::UsersController < ApplicationController
  before_action :set_locale

  def create
    user = User.new(user_params)

    if !user.email.include?('@')
      render json: {error: t("error_creating_user")}, status: 400
    elsif user.save
      UserMailer.registration(user).deliver_now
      render json: {success: t("user_created", email: @user.email)}, status: 200
    elsif User.find_by(email: user.email).present?
      render json: {error: t("user_exists", email: @user.email)}, status: 400
    else
      render json: {error: t("error")}, status: 400
    end
  end

  def destroy
    user = User.find_by_email(params[:email])
    if user.present?
      user.destroy
      render json: {success: t("user_deleted", email: user.email)}, status: 200
    else
      render json: {error: t("user_not_registered")}, status: 400
    end
  end


  private

  def set_locale
    if !params[:language].nil?
      I18n.locale = params[:language]
    else
      I18n.locale = 'en'
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :language, :state_name)
  end
end
