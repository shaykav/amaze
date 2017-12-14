Rails.application.routes.draw do

  root 'pages#home'

  get 'pages/home'

  devise_for :users, controllers: { sessions: 'users/sessions' }

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end

  resources :itineraries
  

end
