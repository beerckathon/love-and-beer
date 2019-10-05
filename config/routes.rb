Rails.application.routes.draw do
  root to: 'posts#index'
  get '/signup', to: 'users#new'
  resources :users
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/temp', to: 'posts#temp'
  post 'cheer', to: 'posts#cheer'
  delete '/logout',  to: 'sessions#destroy'
  resources :posts, only: %i[new create destroy]
end
