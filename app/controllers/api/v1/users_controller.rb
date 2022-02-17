class Api::V1::UsersController < ApplicationController
  before_action :set_locale

  def create
    user = User.new(user_params)

    if !user.email.include?('@')
      render json: {error: "Error creating subscriber. A valid email must be provided."}, status: 400
    elsif user.save
      UserMailer.registration(user).deliver_now
      render json: {success: "A confirmation email for state election reminders has been sent to #{user.email}."}, status: 200
    elsif User.find_by(email: user.email).present?
      render json: {error: "#{user.email} is already subscribed to receive election notifications."}, status: 400
    else
      render json: {error: "Error creating subscriber. Please ensure all elements in the form are filled out correctly."}, status: 400
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.present?
      user.destroy
      render json: {success: "You have successfully unsubscribed from Mi Voz, Mi Voto's email list. You will no longer receive email notifications at #{user.email}."}, status: 200
    else
      render json: {error: "This email is not currently registered to receive emails."}, status: 400
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
