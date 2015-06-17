class MenusController < ApplicationController
  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    menu = restaurant.menus.new(name: params[:name],
                                start_time: params[:menuStart],
                                end_time: params[:menuEnd]
                              )
    menu.save!
    render nothing: true
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    @menu.update(menu_params)
    redirect_to restaurant_path(@menu.restaurant_id)
  end

  def destroy
    restaurant = Restaurant.find(params[:restaurant_id])
    menu = Menu.find(params[:id])
    menu.destroy!
    redirect_to restaurant_path(restaurant)
  end

  def publish
    menu = Menu.find(params[:id])
    menu.publish!
    redirect_to restaurant_path(menu.restaurant)
  end

  def pause
    menu = Menu.find(params[:id])
    menu.pause!
    redirect_to restaurant_path(menu.restaurant)
  end

  def unpause
    menu = Menu.find(params[:id])
    menu.unpause!
    redirect_to restaurant_path(menu.restaurant)
  end

  private
  def menu_params
    params.require(:menu).permit(:name, :start_time, :end_time, :start_date, :end_date)
  end

end