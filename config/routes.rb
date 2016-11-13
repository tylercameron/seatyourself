Rails.application.routes.draw do

  get 'restaurants/index'

  get 'restaurants/edit'

  get 'restaurants/show'

  get 'restaurants/create'

  get 'restaurants/new'

  get 'restaurants/destroy'

  get 'restaurants/update'

	root 'users#new'

	resources :reservations
	resources :restaurants
	resources :users
	resources :sessions, only: [:new, :create, :destroy]
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
