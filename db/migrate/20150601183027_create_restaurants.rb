class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :phone_number
      t.string :image_url
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :restaurants, :users
  end
end
