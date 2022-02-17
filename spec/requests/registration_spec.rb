require 'rails_helper'

RSpec.describe 'User Registration/ Email Api' do
  describe 'happy path' do
    it 'successfully creates a user' do
      user_params = {
        first_name: 'Luis',
        last_name: 'Arroyo',
        state_name: 'co',
        email: 'Notmyemail@email.com',
        language: 'es'
      }

      headers = { CONTENT_TYPE: 'application/json', Accept: 'application/json' }
      post '/api/v1/users', headers: headers, params: user_params.to_json
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(User.last.email).to eq(user_params[:email])
      expect(json[:success]).to eq("Ahora usted esta registrado para recibir notificaciones sobre las proximas elecciones en su estado. Un correo electronico do confirmacion ha sido enviado.")
    end

    it 'successfully deletes/unsubscribes a user' do
      user = User.create!(
        first_name: 'Test',
        last_name: 'User',
        state_name: 'co',
        email: 'Test@email.com',
        language: 'en'
      )

      expect(User.all).to include(user)

      params = {
        email: 'Test@email.com'
      }

      headers = { CONTENT_TYPE: 'application/json', Accept: 'application/json' }
      delete '/api/v1/users/', headers: headers, params: params.to_json
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
      expect(User.all).to_not include(user)
      expect(json[:success]).to eq("You have successfully unsubscribed from Mi Voz, Mi Voto's email list. You will no longer receive email notifications at #{user.email}.")
    end
  end

  describe 'sad path' do

    it 'returns correct error with an invalid email' do
      user_params = {
        first_name: 'Luis',
        last_name: 'Arroyo',
        state_name: 'co',
        postal_code: 80011,
        email: 'Weird%email.com',
        language: 'en'
      }

      headers = { CONTENT_TYPE: 'application/json', Accept: 'application/json' }
      post '/api/v1/users', headers: headers, params: user_params.to_json
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(json[:error]).to eq("Error creating subscriber. A valid email must be provided.")
    end
  end
end
