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
  resources :menus
  end

  resources :menus, only: [] do
    resources :dishes, only: [:create, :show, :edit, :update, :destroy]
  end

  resources :dishes do
    resources :dish_diets, only: [:destroy]
    resources :dish_extras, only: [:index, :new, :create, :destroy]
  end
  resources :ingredients, only: [:create]

  post '/dishes/:dish_id/dish_diets/:id' => 'dish_diets#create'

  # MENU change state
  patch '/publish_menu/:id' => 'menus#publish', as: :menu_publish
  patch '/cancel_menu/:id' => 'menus#cancel', as: :menu_cancel

  # API
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :restaurants, only: [:index, :show]
    end
  end

end