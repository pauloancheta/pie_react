class Menu < ActiveRecord::Base
  include Workflow

  belongs_to :restaurant
  has_many :dishes

  validates :name, presence: true

  workflow do
    state :draft
    state :available
  end
end
