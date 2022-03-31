Rails.application.routes.draw do
  resources :todos, only: [:create, :update] do
    get "/move_higher", to: "todos#move_higher"
    get "/move_lower", to: "todos#move_lower"
  end
  get '/auth/:user_id', to: 'session#auth'
  root to: 'pages#home'
  resources :users, only: [:create]
  get '/register', to: 'users#register'
  resources :session, only: [:new, :create]
end
