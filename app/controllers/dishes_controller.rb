class DishesController < ApplicationController
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

  def destroy
    dish = Dish.find(params[:id])
    dish.destroy!
    render nothing: true
  end
end