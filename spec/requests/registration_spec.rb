require 'rails_helper'

RSpec.describe 'User Registration/ Email Api' do
  describe 'happy path' do
    it 'successfully creates a user' do
      user_params = {
        first_name: 'Luis',
        last_name: 'Arroyo',
        state: 'Colorado',
        postal_code: 80011,
        email: 'Notmyemail@email.com',
        language: 'en'
      }

      headers = { CONTENT_TYPE: 'application/json', Accept: 'application/json' }
      post '/api/v1/users', headers: headers, params: user_params.to_json
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(User.last.email).to eq(user_params[:email])
      expect(json[:success]).to eq("User created. A confirmation email has been sent to the user.")
    end
  end

  describe 'sad path' do

    it 'returns correct error with an invalid email' do
      user_params = {
        first_name: 'Luis',
        last_name: 'Arroyo',
        state: 'Colorado',
        postal_code: 80011,
        email: 'Weird%email.com',
        language: 'en'
      }

      headers = { CONTENT_TYPE: 'application/json', Accept: 'application/json' }
      post '/api/v1/users', headers: headers, params: user_params.to_json
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(json[:error]).to eq("Error creating user. A valid email must be provided.")
    end
  end
end
