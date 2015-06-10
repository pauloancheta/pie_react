class UsersController < ApplicationController
  def new
    if !user_signed_in?
      @user = User.new
    else
      redirect_to '/login'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update user_params
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def create
    @user = User.new user_params
    @user.is_admin = false # All created users should not be admin unless specified by super user
    if @user.save
      session[:user_id] = @user.id
      initialize_preference(@user)
      redirect_to root_path
    else
      redirect_to '/login'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :is_admin, :password, :password_confirmation)
  end

  def initialize_preference(user)
    p = Preference.new
    p.user_id = user.id
    p.diet_id = Diet.first.id
    p.save!
  end
end