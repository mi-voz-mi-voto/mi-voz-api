require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'email notification' do
    it 'has correct headers' do
      user = User.create!(
        first_name: 'Will',
        last_name: 'Ferrell',
        state: 'Arkansas',
        postal_code: 98256,
        email: 'bestactorever@gmail.com',
        language: 'en'
      )

      email = UserMailer.registration(user)

      expect(email.to).to eq([user.email])
      expect(email.from).to eq([ENV['user_email']])
      expect(email.subject).to eq('Success')
    end
  end
end
