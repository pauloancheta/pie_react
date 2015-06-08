require 'rails_helper'

RSpec.describe Menu, type: :model do
  let (:restaurant) {create(:restaurant)}
  let (:restaurant_2) {create(:restaurant)}
  def valid_attributes (new_attr = {})
    attribute = {
      name: Faker::Company.name,
      start_time: Time.now,
      end_time: Time.now + 1.hour,
      restaurant_id: restaurant.id
    }
    attribute.merge(new_attr)
  end

  describe "validations" do
    it "requires a name" do
      menu = Menu.new(valid_attributes(name: nil))
      expect(menu).to be_invalid
    end

    it "cannot have 2 same names in one Restaurant" do
      menu = Menu.create(valid_attributes(name: "Hello"))
      menu_2 = Menu.new(valid_attributes(name: "Hello"))
      expect(menu_2).to be_invalid
    end

    it "can create a same name with different Restaurants" do
      menu = Menu.create(valid_attributes(name: "Hello"))
      menu_2 = Menu.new(valid_attributes(name: "Hello", restaurant_id: restaurant_2.id))
      expect(menu_2).to be_valid
    end
  end

  describe "workflow" do
    it "assigns draft to newly created menu" do
      menu = Menu.create(valid_attributes)
      menu
      expect(menu.workflow_state).to eq("draft")
    end

    it "becomes available when published" do
      menu = Menu.create(valid_attributes)
      menu.publish!
      expect(menu.workflow_state).to eq("available")
    end

    it "becomes unavailable when paused" do
      menu = Menu.create(valid_attributes)
      menu.publish!
      menu.pause!
      expect(menu.workflow_state).to eq("unavailable")
    end

    it "becomes available again when unpaused" do
      menu = Menu.create(valid_attributes)
      menu.publish!
      menu.pause!
      menu.unpause!
      expect(menu.workflow_state).to eq("available")
    end

    it "becomes cancelled when cancelled from unavailable state" do
      menu = Menu.create(valid_attributes)
      menu.publish!
      menu.pause!
      menu.cancel!
      expect(menu.workflow_state).to eq("cancelled")
    end
  end
end
