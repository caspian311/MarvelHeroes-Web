Rails.application.routes.draw do
  resources :home, only: [:index]

  resources :users, only: [:new, :create]
  resources :session, only: [:new, :create, :destroy]
  get 'templates/*template', to: 'templates#show'

  namespace :api do
    resources :characters
  end

  root 'home#index'
end
