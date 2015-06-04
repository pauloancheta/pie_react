class MenusController < ApplicationController
  before_action :find_menu, only: [:destroy]
  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    menu = restaurant.menus.new(name: params[:name])
    menu.save!
    render nothing: true
  end

  def destroy
    @menu.destroy!
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

  private
  def find_menu
    @menu = Menu.find(params[:id])
  end
end