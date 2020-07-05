Rails.application.routes.draw do
  root 'reviews#index'
  resources :users, except: [:index, :new]
  resources :reviews
  resources :courses, except: :destroy
  resources :followings, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
