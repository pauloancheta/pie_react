class DishesController < ApplicationController
  before_action :find_dish, only: [:create, :pause, :unpause]
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

  def publish
    dish.publish!
    render nothing: true
  end

  def pause
    dish.pause!
    render nothing: true
  end

  def unpause
    dish.unpause!
    render nothing: true
  end

  private
  def find_dish
    dish = Dish.find(params[:id])
  end
end