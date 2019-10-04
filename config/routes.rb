Rails.application.routes.draw do
  root to: 'posts#index'
  get '/signup', to: 'users#new'
  resources :users
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :posts, only: %i[new create destroy]
end
