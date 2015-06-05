class Api::V1::DishesController < ApplicationController
  def index
    @menu = Menu.find(params[:menu_id])
    @dishes = @menu.dishes.all
  end
end
