class MenusController < ApplicationController
  def create
    menu = Menu.find(params[:id])
    restaurant = Restaurant.find(params[:restaurant_id])
    menu = restaurant.menus.new(name: params[:name])
    menu.save!
    render nothing: true
  end

  def destroy
    menu = Menu.find(params[:id])
    menu.destroy!
    render nothing: true
  end

  def publish
    menu = Menu.find(params[:id])
    menu.publish!
    render nothing: true
  end

  def pause
    menu = Menu.find(params[:id])
    menu.pause!
    render nothing: true
  end

  def unpause
    menu = Menu.find(params[:id])
    menu.unpause!
    render nothing: true
  end
end