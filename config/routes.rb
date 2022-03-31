Rails.application.routes.draw do
  resources :todos, only: [:create, :update]
  get '/auth/:user_id', to: 'session#auth'
  root to: 'pages#home'
  resources :users, only: [:create]
  get '/register', to: 'users#register'
  resources :session, only: [:new, :create]
end
