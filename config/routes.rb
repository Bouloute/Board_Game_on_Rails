Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :new, :create]
  resources :sessions, only: [:new, :create]
  resources :board_games, only: [:index, :show, :new, :create]
  resources :games, only: [:create]

  resources :users do
    resources :board_games
  end

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/auth/:provider/callback', to: "sessions#create"
  delete '/logout', to: 'sessions#destroy'

  get '/', to: 'board_games#index'
end
