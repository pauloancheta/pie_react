class RestaurantsController < ApplicationController
  def create
    Restaurant.create_from_api(params)
    render nothing: true
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end
end