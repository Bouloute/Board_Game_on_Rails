Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :new, :create]
  resources :sessions, only: [:new, :create]
  resources :board_games, only: [:index, :show, :new, :create]
  resources :games, only: [:create]

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  #delete '/signout', to: 'sessions#destroy'
end
