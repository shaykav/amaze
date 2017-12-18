Rails.application.routes.draw do

  root 'pages#home'
  get 'pages/home'

  get '/maze/:id', to: 'itineraries#intro', as: 'maze_intro'

  get '/manage', to: 'itineraries#manage_itineraries', as: 'manage'

  devise_for :users

  resources :users do
    resource :reviews
  end


  resources :itineraries do
    resources :reviews
  end

  # resources :itineraries
  post '/pages/home' => 'reviews#create'
end
