class Api::V1::UsersController < ApplicationController
  def create
    user_info = request.POST
    user = User.new(user_params)
    if user.save
      UserMailer.registration(user).deliver_now
      render json: "Success", status: 200
    else
      render json: "Fail", status: 400
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :language, :state, :postal_code)
  end
end
