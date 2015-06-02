class MenusController < ApplicationController
  before_action :find_menu, only: [:show, :update, :destroy]
  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    menu = restaurant.menus.new(name: params[:name])
    menu.save!
    render nothing: true
  end

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menus = @restaurant.menus
    render json: @menus
  end

  def show
    @menu = Menu.find(params[:id])
    render json: @menu
  end

  def update
    @menu.update!
    render nothing: true
  end

  def destroy
    @menu.destroy!
    render nothing: true
  end

  private
  def find_menu
    @menu = Menu.find(params[:id])
  end
end