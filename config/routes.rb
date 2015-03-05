Rails.application.routes.draw do

	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	post '/logout', to: 'sessions#destroy'

  resources :songs
  resources :users
end
