class UserMailer < ApplicationMailer
  default from: ENV['user_email']

  def registration(user)
    @user = user
    mail(to: @user.email, subject: t('registration_confirmation'))
  end
end
