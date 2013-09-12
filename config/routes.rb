Sy::Application.routes.draw do

  root :to => 'home#home'

  resources :restaurants

  resources :users
  resources :sessions, only: [:create, :destroy, :new]

end
