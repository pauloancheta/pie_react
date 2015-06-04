Rails.application.routes.draw do
  root 'home#index'

  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  # resources :sessions, only: [:new, :create, :destroy]
  resources :users

  resources :restaurants, only: [:create, :show] do
    resources :menus, only: [:create]
  end

  resources :menus, only: [] do
    resources :dishes, only: [:create]
  end

  patch '/publish_menu/:id' => 'menus#publish', as: :menu_publish
  patch '/pause_menu/:id' => 'menus#pause', as: :menu_pause
  patch '/unpause_menu/:id' => 'menus#unpause', as: :menu_unpause
end
