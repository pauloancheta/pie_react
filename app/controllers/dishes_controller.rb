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
  end

  def update
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