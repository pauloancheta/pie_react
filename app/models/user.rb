class User < ActiveRecord::Base
  has_secure_password

  def self.create_from_api(response)
    User.new_from_api(response).save
  end

  def self.new_from_api(response)
    User.new(
      name: response[:name],
      email: response[:email],
      is_admin: response[:is_admin],
      password: response[:password],
      password_confirmation: response[:password_confirmation]
    )
  end
end
