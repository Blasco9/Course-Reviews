Rails.application.routes.draw do
  root 'reviews#index'
  resources :users, except: :index
  resources :reviews
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
