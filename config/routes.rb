Rails.application.routes.draw do


  devise_for :users, controllers: { sessions: 'users/sessions' }

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end

  root 'itineraries#new'

  resources :itineraries
  

end
