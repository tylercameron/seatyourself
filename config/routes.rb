Rails.application.routes.draw do
  root 'users#index'

  resources :reservations
  resources :restaurants
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

end
