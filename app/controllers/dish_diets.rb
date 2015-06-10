class DishDietsController < ApplicationController
  def create
    dish = Dish.find(params[:dish_id])
    diet = Diet.find(params[:id])
    dd = DishDiet.new(dish_id: dish.id, diet_id: diet.id)
    dd.save!
    render nothing: true
  end

  def destroy
    dd = DishDiet.where(dish_id: params[:dish_id], diet_id: params[:diet_id])
    dd.destroy!
    render nothing: true
  end
end