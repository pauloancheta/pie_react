class Dish < ActiveRecord::Base
  include Workflow

  belongs_to :menu
  has_many :dish_diets, dependent: :destroy
  has_many :diets, through: :dish_diets, dependent: :nullify
  has_many :dish_extras, dependent: :destroy

  workflow do
    state :draft do
      event :publish, transitions_to: :available
    end
    state :available do
      event :pause, transitions_to: :unavailable
    end
    state :unavailable do
      event :unpause, transitions_to: :available
      event :cancel, transitions_to: :cancelled
    end
    state :cancelled
  end
end
