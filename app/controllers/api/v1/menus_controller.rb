class Api::V1::MenusController < ApplicationController
  def index
    @menus = Menu.all.order('id ASC')
  end
end
