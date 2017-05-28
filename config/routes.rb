Rails.application.routes.draw do
  resources :home, only: [:index]

  resources :users, only: %i[new create]

  resources :api_accesses, only: %i[new create destroy]

  resources :session, only: %i[new create destroy]
  get 'sessions/destroy', to: 'session#destroy'

  get 'templates/*template', to: 'templates#show'
  get 'foo', to: 'foo#index'

  namespace :api do
    resources :characters
  end

  root 'home#index'
end
