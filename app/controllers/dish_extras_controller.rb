class DishExtrasController < ApplicationController
  def index
    @dish = Dish.find(params[:dish_id])
    @dish_extras = @dish.dish_extras.all
    render json: @dish_extras
  end

  def new
  end

  def create
  end

  def destroy
  end
end