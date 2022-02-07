require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'email notification' do
    it 'has correct headers' do
      user = User.create!(
        first_name: 'Will',
        last_name: 'Ferrell',
        state_name: 'Arkansas',
        email: 'bestactorever@gmail.com',
        language: 'es'
      )

      email = UserMailer.registration(user)

      expect(email.to).to eq([user.email])
      expect(email.from).to eq([ENV['user_email']])
      expect(email.subject).to eq('Registration Confirmation')
    end
  end
end
