class Api::V1::UsersController < ApplicationController
  before_action :set_locale

  def create
    user = User.new(user_params)
    
    if !user.email.include?('@')
      render json: {error: "Error creating subscriber. A valid email must be provided."}, status: 400
    elsif user.save
      UserMailer.registration(user).deliver_now
      render json: {success: "You are now registered to receive notifications about upcoming elections in your state. A confirmation email has been sent to #{user.email}."}, status: 200
    elsif User.find_by(email: user.email).present?
      render json: {error: "This email is already susbscribed to receive election notifications."}, status: 400
    else
      render json: {error: "Error creating subscriber. Please ensure all elements in the form are filled out correctly."}, status: 400
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

    render json: {success: "You have successfully unsubscribed from Mi Voto, Mi Voz's email list. You will no longer receive email notifications at #{user.email}."}, status: 200
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
