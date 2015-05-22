class UsersController < ApplicationController
  def create
    user = User.create_from_api(params)
    render nothing: true
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :is_admin, :password, :password_confirmation)
  end
end