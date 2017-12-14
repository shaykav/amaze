Rails.application.routes.draw do

  root 'itineraries#new'

  resources :itineraries
  
end
