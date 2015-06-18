class DishExtrasController < ApplicationController
  def index
    @dish = Dish.find(params[:dish_id])
    @dish_extras = @dish.dish_extras.all
    render json: @dish_extras
  end

  def create
    @dish = Dish.find(params[:dish_id])
    @dish_extras = @dish.dish_extras.new de_params
    @dish.save!
    redirect_to dish_path(@dish)
  end

  def destroy
  end

  private
  def de_params
    params.require(:dish_extra).permit(:description)
  end
end