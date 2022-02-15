class UserMailer < ApplicationMailer
  default from: ENV['user_email']

  def registration(user)
    @user = user
    mail(to: @user.email, subject: t('registration_confirmation'))
  end

  # def monthly_update(user)
  #   @user = user
  #   @elections = ElectionsFacade.elections(@user.location)
  #   @referendums = ElectionsFacade.referendums(@user.location)
  #   @state_voting_info = ElectionsFacade.state_info(@user.location)
  #
  #   mail(to: @user.email, subject: )
  # end
end
