class DishesController < ApplicationController
  def create
    dish = Dish.new(
                    name: params[:name],
                    price: params[:price],
                    description: params[:description],
                    menu_id: params[:menu_id],
                    primary_diet: params[:primary_diet],
                    optional_diet: params[:optional_diet]
                  )
    dish.save!
    render nothing: true
  end

  def destroy
    dish = Dish.find(params[:id])
    dish.destroy!
    render nothing: true
  end

  def publish
    dish = Dish.find(params[:id])
    dish.publish!
    render nothing: true
  end

  def pause
    dish = Dish.find(params[:id])
    dish.pause!
    render nothing: true
  end

  def unpause
    dish = Dish.find(params[:id])
    dish.unpause!
    render nothing: true
  end
end