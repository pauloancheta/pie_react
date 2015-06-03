class Dish < ActiveRecord::Base
  include Workflow

  belongs_to :menu

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
