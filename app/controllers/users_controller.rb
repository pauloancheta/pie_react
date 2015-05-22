class UsersController < ApplicationController
  def create
    user = User.create_from_api(params)
    if user
      sessions[:user_id] = user.id
    end

    render nothing: true
  end
end