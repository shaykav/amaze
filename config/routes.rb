Rails.application.routes.draw do

  root 'pages#home'

  get 'pages/home'

  get '/maze/:id', to: 'itineraries#intro', as: 'maze_intro'

  devise_for :users

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end

  resources :itineraries
  
end
