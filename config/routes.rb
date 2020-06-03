Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :new, :create]

  get '/signup', to: 'users#new'
  #get '/signin', to: 'sessions#new'
  #post '/signin', to: 'sessions#create'
  #delete '/signout', to: 'sessions#destroy'
end
