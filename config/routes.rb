Rails.application.routes.draw do
  root 'restaurants#index'

<<<<<<< HEAD
resources :users
resources :sessions, only: [:new, :create, :destroy]

  resources :restaurants do
    resources :reservations

  end

=======
  resources :restaurants 
  resources :reservations
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
>>>>>>> 00a911db3c4aa8a52d7241a4c520ec7ea74d69bc
end
