Rails.application.routes.draw do
  root 'home#index'

  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  # resources :sessions, only: [:new, :create, :destroy]
  resources :users do
    resources :restaurants
  end

  resources :restaurants, only:[] do
    resources :menus
  end
end
