# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'

    resource '/users',
      headers: :any,
      resource: '*',
      expose: ['Access-Control-Allow-Origin'],
      methods: [:get, :post, :delete, :patch]
    resource '/elections',
      headers: :any,
      resource: '*',
      expose: ['Access-Control-Allow-Origin'],
      methods: [:get]
  end
end
