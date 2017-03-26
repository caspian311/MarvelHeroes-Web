Rails.application.routes.draw do
  resources :home, only: [:index]

  resources :users, only: [:new, :create]
  resources :session, only: [:new, :create, :destroy]

  root 'home#index'
end
