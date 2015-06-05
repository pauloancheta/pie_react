Rails.application.routes.draw do
  root 'home#index'

  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  resources :users

  resources :restaurants, only: [:create, :show] do
    resources :menus, only: [:create]
  end

  resources :menus, only: [] do
    resources :dishes, only: [:create]
  end

  delete '/dishes/:id' => 'dishes#destroy'

  # MENU change state
  patch '/publish_menu/:id' => 'menus#publish', as: :menu_publish
  patch '/pause_menu/:id' => 'menus#pause', as: :menu_pause
  patch '/unpause_menu/:id' => 'menus#unpause', as: :menu_unpause

  # DISH change state
  patch '/publish_dish/:id' => 'dishes#publish', as: :dishes_publish
  patch '/pause_dish/:id' => 'dishes#pause', as: :dishes_pause
  patch '/unpause_dish/:id' => 'dishes#unpause', as: :dishes_unpause

end