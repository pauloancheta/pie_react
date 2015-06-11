Rails.application.routes.draw do
  root 'home#index'

  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new', as: :new_session
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  resources :users

  resources :restaurants, only: [:create, :show] do
    resources :menus, only: [:create, :destroy]
  end

  resources :menus, only: [] do
    resources :dishes, only: [:create]
  end

  resources :dishes do
    resources :dish_diets, only: [:destroy]
  end
  resources :ingredients, only: [:create]

  delete '/dishes/:id' => 'dishes#destroy'
  post '/dishes/:dish_id/dish_diets/:id' => 'dish_diets#create'

  # MENU change state
  patch '/publish_menu/:id' => 'menus#publish', as: :menu_publish
  patch '/pause_menu/:id' => 'menus#pause', as: :menu_pause
  patch '/unpause_menu/:id' => 'menus#unpause', as: :menu_unpause

  # DISH change state
  patch '/publish_dish/:id' => 'dishes#publish', as: :dishes_publish
  patch '/pause_dish/:id' => 'dishes#pause', as: :dishes_pause
  patch '/unpause_dish/:id' => 'dishes#unpause', as: :dishes_unpause

  # API
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :restaurants, only: [:index, :show]
    end
  end

end