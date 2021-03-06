class MenusController < ApplicationController
  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    menu = restaurant.menus.new(name: params[:name],
                                description: params[:description],
                                start_time: params[:startTime],
                                end_time: params[:endTime],
                                start_date: params[:startDate],
                                end_date: params[:endDate]
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

  def cancel
    menu = Menu.find(params[:id])
    menu.cancel!
    redirect_to restaurant_path(menu.restaurant)
  end

  private
  def menu_params
    params.require(:menu).permit(:name, :start_time, :end_time, :start_date, :end_date)
  end
end