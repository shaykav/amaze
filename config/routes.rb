Rails.application.routes.draw do

  root 'pages#home'

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
