Rails.application.routes.draw do

  root 'pages#home'

  get '/maze/:id', to: 'itineraries#intro', as: 'maze_intro'

  get '/manage', to: 'itineraries#manage_itineraries', as: 'manage'

  devise_for :users
  
  resources :users do      
    resource :reviews
  end

  get 'pages/home'
  
  resources :itineraries do
    resources :reviews
  end

  resources :itineraries
  
end
