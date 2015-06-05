class Api::V1::MenusController < ApplicationController
  def index
    @menus = Menu.all.with_available_state
    render json: @menus
  end
end
