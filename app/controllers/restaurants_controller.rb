class RestaurantsController < ApplicationController
  def create
    Restaurant.create_from_api(params)
    render nothing: true
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    current_user.is_admin ? (@menus = @restaurant.menus.all.decorate) : (@menus = @restaurant.menus.with_available_state.decorate)
    @new_menu = @restaurant.menus.new
  end
end