Rails.application.routes.draw do
  root to: 'organizations#index', constraints: { subdomain: /(app)/ }
  root to: 'organizations#show', constraints: { subdomain: /.+/ }
  root to: redirect('/', subdomain: 'app'), constraints: { subdomain: // }

  get '/join', to: 'join#start', as: 'join_start'
  get '/join/you', to: 'join#user', as: 'join_user'
  get '/join/you/verify', to: 'join#verify', as: 'join_verify'
  get '/join/organization', to: 'join#organization', as: 'join_organization'
  get '/join/organization/invite', to: 'join#invite', as: 'join_invite'

  get '/login', to: 'sessions#new'
  post '/sessions/create', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users
  resources :teams
  resources :projects do
    resources :garments

    get '/calendar', to: 'project#calendar'
    get '/specifications', to: 'project#specifications'
    get '/settings', to: 'project#edit'
  end
end
