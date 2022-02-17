class UserMailer < ApplicationMailer
  default from: ENV['user_email']

  def registration(user)
    @user = user
    mail(to: @user.email, subject: t('registration_confirmation'))
  end

  def monthly_update(user)
    elections = ElectionsFacade.elections(user[:state_name])
    referendums = ElectionsFacade.referendums(user[:state_name])
    state = ElectionsFacade.state_info(user[:state_name])

    @user = user
    @facade = {elections: elections, referendums: referendums, state: state}
    mail(to: @user.email, subject: "Your monthly update is here!")
  end
end
