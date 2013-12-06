Sy::Application.routes.draw do
  root to: 'home#home'

  resources :restaurants do
    resources :reservations, only: :create
  end

  resources :users, only: [:show, :new, :create]
  resources :sessions, only: [:create, :destroy, :new]

  get 'login' => 'sessions#new', :as => :login
  post 'logout' => 'sessions#destroy', :as => :logout
end
