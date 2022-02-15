class UserMailer < ApplicationMailer
  default from: ENV['user_email']

  def registration(user)
    @user = user
    mail(to: @user.email, subject: t('registration_confirmation'))
  end

  def monthly_update(user)
    @user = user
    mail(to: @user.email, subject: "Your monthly update is here!"
  end
end
