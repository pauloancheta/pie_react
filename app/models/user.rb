class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  validates :password_confirmation, presence: true
  has_many :restaurants
  has_one :preference
end
