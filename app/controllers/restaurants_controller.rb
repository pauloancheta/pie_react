class RestaurantsController < ApplicationController
  def create
    Restaurant.create_from_api(params)
    render nothing: true
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    if current_user.is_admin
      @menus = @restaurant.menus.all.order('id ASC').decorate
    else
      @menus = @restaurant.menus.with_published_state.order('id ASC').decorate
    end
    @new_menu = @restaurant.menus.new
    @diets = Diet.all
  end
end