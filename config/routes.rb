Rails.application.routes.draw do

  # get 'favorites/index'
  #
  # get 'favorites/show'
  #
  # get 'favorites/new'
  #
  # get 'favorites/create'
  #
  # get 'favorites/destroy'

  get '/favorites', to: 'itineraries/favorites#manage_favorites', as: 'favorites' 

  root 'pages#home'

  get '/maze/:id', to: 'itineraries#intro', as: 'maze_intro'

  get '/manage', to: 'itineraries#manage_itineraries', as: 'manage'

  post '/maze/:id', to: 'reviews#create', as: 'review_itinerary'
  devise_for :users

  resources :users
  resources :reviews

  get 'pages/home'

  resources :itineraries do
    resources :favorites, only: %w(create destroy), :controller => 'itineraries/favorites'
  end

end
