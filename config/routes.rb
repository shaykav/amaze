Rails.application.routes.draw do

  root 'pages#home'

  get '/maze/:id', to: 'itineraries#intro', as: 'maze_intro'

  get '/manage', to: 'itineraries#manage_itineraries', as: 'manage'

  put '/maze/:id', to: 'itineraries#intro', as: 'review_itinerary'
  devise_for :users

  resources :users do
    resource :reviews
  end

  get 'pages/home'

  resources :itineraries do
    resource :reviews, module: :itineraries
  end

  resources :itineraries


end
