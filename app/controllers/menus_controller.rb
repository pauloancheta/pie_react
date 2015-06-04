class MenusController < ApplicationController
  before_action :find_menu, only: [:destroy, :publish, :pause, :unpause]
  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    menu = restaurant.menus.new(name: params[:name])
    menu.save!
    render nothing: true
  end

  def destroy
    menu.destroy!
    render nothing: true
  end

  def publish
    menu.publish!
    render nothing: true
  end

  def pause
    menu.pause!
    render nothing: true
  end

  def unpause
    menu.unpause!
    render nothing: true
  end

  private
  def find_menu
    menu = Menu.find(params[:id])
  end
end