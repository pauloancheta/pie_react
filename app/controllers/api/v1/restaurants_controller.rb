class Api::V1::RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @menus = @restaurant.menus.order('id ASC').decorate
  end
end
