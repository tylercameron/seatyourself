Rails.application.routes.draw do

	root 'users#new'

	resources :reservations
	resources :restaurants
	resource :users, only: %i(new create)
	resources :sessions, only: [:new, :create, :destroy]
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
