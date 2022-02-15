Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :elections, only: [:index]
      delete '/users', to: 'users#destroy'
    end
  end
end
