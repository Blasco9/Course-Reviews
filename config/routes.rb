Rails.application.routes.draw do
  root 'reviews#index'
  resources :users, except: :index
  resources :reviews
  resources :followings, only: [:create, :destroy]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
