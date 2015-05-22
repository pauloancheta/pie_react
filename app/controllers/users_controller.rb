class UsersController < ApplicationController
  def create
    user = User.create_from_api(params)
    if user
      session[:user_id] = user.id
    end
    puts session

    render nothing: true
  end
end