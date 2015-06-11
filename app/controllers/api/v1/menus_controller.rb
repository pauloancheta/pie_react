class Api::V1::MenusController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menus = @restaurant.menus.order('id ASC').decorate
  end
end
