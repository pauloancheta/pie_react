# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150617191654) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "diets", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dish_diets", force: :cascade do |t|
    t.integer  "dish_id"
    t.integer  "diet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "dish_diets", ["diet_id"], name: "index_dish_diets_on_diet_id", using: :btree
  add_index "dish_diets", ["dish_id"], name: "index_dish_diets_on_dish_id", using: :btree

  create_table "dish_extras", force: :cascade do |t|
    t.integer  "dish_id"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "dish_extras", ["dish_id"], name: "index_dish_extras_on_dish_id", using: :btree

  create_table "dishes", force: :cascade do |t|
    t.string   "name"
    t.string   "price"
    t.string   "description"
    t.integer  "menu_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "dishes", ["menu_id"], name: "index_dishes_on_menu_id", using: :btree

  create_table "filtered_ingredients", force: :cascade do |t|
    t.integer  "preference_id"
    t.integer  "ingredient_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "filtered_ingredients", ["ingredient_id"], name: "index_filtered_ingredients_on_ingredient_id", using: :btree
  add_index "filtered_ingredients", ["preference_id"], name: "index_filtered_ingredients_on_preference_id", using: :btree

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "restaurant_id"
    t.string   "workflow_state"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "category"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "description"
  end

  add_index "menus", ["restaurant_id"], name: "index_menus_on_restaurant_id", using: :btree

  create_table "preferences", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "diet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "preferences", ["diet_id"], name: "index_preferences_on_diet_id", using: :btree
  add_index "preferences", ["user_id"], name: "index_preferences_on_user_id", using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "email"
    t.string   "phone_number"
    t.string   "image_url"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "restaurants", ["user_id"], name: "index_restaurants_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "is_admin"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "dish_diets", "diets"
  add_foreign_key "dish_diets", "dishes"
  add_foreign_key "dish_extras", "dishes"
  add_foreign_key "dishes", "menus"
  add_foreign_key "filtered_ingredients", "ingredients"
  add_foreign_key "filtered_ingredients", "preferences"
  add_foreign_key "menus", "restaurants"
  add_foreign_key "preferences", "diets"
  add_foreign_key "preferences", "users"
  add_foreign_key "restaurants", "users"
end
