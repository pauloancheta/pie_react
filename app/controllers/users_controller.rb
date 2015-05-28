class UsersController < ApplicationController
  def new
    if !user_signed_in?
      @user = User.new
    else
      redirect_to '/login'
    end
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to '/login'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :is_admin, :password, :password_confirmation)
  end
end