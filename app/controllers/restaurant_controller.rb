class RestaurantController < ApplicationController
  def create
    Restaurant.create_from_api()
  end
end