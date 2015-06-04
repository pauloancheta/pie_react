class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    @user = User.new
    @user = User.all
    @restaurants = Restaurant.all
  end
end