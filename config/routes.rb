Rails.application.routes.draw do


  get 'reviews/index'

  get 'reviews/new'

  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :users do      
    resource :reviews
  end

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end

  root 'itineraries#new'

  resources :itineraries do
    resources :reviews
  end


end
