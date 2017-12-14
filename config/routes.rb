Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }

  root to: "home#index"

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end

end
