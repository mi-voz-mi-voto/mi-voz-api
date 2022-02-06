class ApplicationMailer < ActionMailer::Base
  default from: ENV['user_email']
  layout 'mailer'
end
