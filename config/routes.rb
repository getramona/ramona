Rails.application.routes.draw do
  root to: 'organization#index'

  get '/login', to: 'sessions#new'
  post '/sessions/create', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
  resources :users
  resources :teams
  resources :lines do
    resources :garments
  end
end
