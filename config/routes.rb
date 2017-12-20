Rails.application.routes.draw do

  get 'favorites/index'

  get 'favorites/show'

  get 'favorites/new'

  get 'favorites/create'

  get 'favorites/destroy'

  root 'pages#home'

  get '/maze/:id', to: 'itineraries#intro', as: 'maze_intro'

  get '/manage', to: 'itineraries#manage_itineraries', as: 'manage'

  post '/maze/:id', to: 'reviews#create', as: 'review_itinerary'
  devise_for :users

  resources :users
  resources :reviews

  get 'pages/home'

  resources :itineraries

end
