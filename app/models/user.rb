class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true
  has_many :restaurants

  def self.create_from_api(response)
    user = User.new_from_api(response)
    user.save
    user
  end

  private

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
