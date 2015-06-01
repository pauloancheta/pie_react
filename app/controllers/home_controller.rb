class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    @user = User.new
    @restaurants = Restaurant.all
  end
end