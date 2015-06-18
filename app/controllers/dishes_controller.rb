class DishesController < ApplicationController
  before_filter :find_dish, only: [:show, :edit, :update, :destroy]
  def create
    dish = Dish.new(
                    name: params[:name],
                    price: params[:price],
                    description: params[:description],
                    menu_id: params[:menu_id]
                  )
    dish.save!
    render nothing: true
  end

  def show
  end

  def edit
    @dish_extra = @dish.dish_extras.new
  end

  def update
    render json: params
    # @menu = Menu.find(params[:menu_id])
    # restaurant = Restaurant.find(@menu.restaurant_id)
    # @dish.update dish_params
    # redirect_to restaurant_path(restaurant)
  end

  def destroy
    dish = Dish.find(params[:id])
    dish.destroy!
    render nothing: true
  end

  private
  def find_dish
    @dish = Dish.find(params[:id])
  end
end