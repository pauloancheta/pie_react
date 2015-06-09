class Menu < ActiveRecord::Base
  include Workflow

  belongs_to :restaurant
  has_many :dishes, dependent: :destroy
  validates :name, presence: true
  validates :name, uniqueness: {scope: :restaurant}


  # workflow do
  #   state :draft do
  #     event :publish, transitions_to: :available
  #   end
  #   state :published do
  #     event :pause, transitions_to: :unavailable
  #   end
  #   state :paused do
  #     event :unpause, transitions_to: :available
  #   end
  #   state :unavailable do
  #     event :cancel, transitions_to: :cancelled
  #     event :unpause, transitions_to: :available
  #   end
  #   state :cancelled
  # end
  workflow do
    state :draft do
      event :publish, transitions_to: :published
    end
    state :published do
      event :cancel, transitions_to: :draft
      event :pause, transitions_to: :paused
    end
    state :paused do
      event :unpause, transitions_to: :published
    end
  end
end
