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

ActiveRecord::Schema.define(version: 20140723054620) do

  create_table "brands", force: true do |t|
    t.string   "name"
    t.string   "parent_company"
    t.string   "website_tw"
    t.string   "website_global"
    t.string   "headquarters"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "brands", ["headquarters"], name: "index_brands_on_headquarters"
  add_index "brands", ["name"], name: "index_brands_on_name", unique: true
  add_index "brands", ["parent_company"], name: "index_brands_on_parent_company"

  create_table "cars", force: true do |t|
    t.string   "model"
    t.string   "chinese_model"
    t.string   "submodel"
    t.string   "chinese_submodel"
    t.string   "generation"
    t.string   "made_in"
    t.integer  "year"
    t.float    "displacement"
    t.integer  "door_num"
    t.boolean  "is_hybrid"
    t.boolean  "is_electric_vehicle"
    t.integer  "airbag_num"
    t.boolean  "has_airbag_at_driver_front"
    t.boolean  "has_airbag_at_passenger_front"
    t.boolean  "has_airbag_at_driver_knee"
    t.boolean  "has_airbag_at_passenger_knee"
    t.boolean  "has_airbag_at_center"
    t.boolean  "has_airbag_for_pedestrian"
    t.boolean  "has_airbags_at_front_side_torso"
    t.boolean  "has_airbags_at_rear_side_torso"
    t.boolean  "has_airbags_at_side_curtain"
    t.boolean  "has_airbags_at_seat_belt"
    t.boolean  "has_esp"
    t.string   "esp_name"
    t.boolean  "has_abs"
    t.boolean  "has_eba"
    t.boolean  "has_ebd"
    t.boolean  "has_isofix"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "brand_id"
    t.integer  "retail_price"
    t.string   "brand_name"
  end

  add_index "cars", ["airbag_num"], name: "index_cars_on_airbag_num"
  add_index "cars", ["brand_id"], name: "index_cars_on_brand_id"
  add_index "cars", ["brand_name"], name: "index_cars_on_brand_name"
  add_index "cars", ["displacement"], name: "index_cars_on_displacement"
  add_index "cars", ["door_num"], name: "index_cars_on_door_num"
  add_index "cars", ["generation"], name: "index_cars_on_generation"
  add_index "cars", ["has_abs"], name: "index_cars_on_has_abs"
  add_index "cars", ["has_airbags_at_side_curtain"], name: "index_cars_on_has_airbags_at_side_curtain"
  add_index "cars", ["has_eba"], name: "index_cars_on_has_eba"
  add_index "cars", ["has_ebd"], name: "index_cars_on_has_ebd"
  add_index "cars", ["has_esp"], name: "index_cars_on_has_esp"
  add_index "cars", ["has_isofix"], name: "index_cars_on_has_isofix"
  add_index "cars", ["is_electric_vehicle"], name: "index_cars_on_is_electric_vehicle"
  add_index "cars", ["is_hybrid"], name: "index_cars_on_is_hybrid"
  add_index "cars", ["made_in"], name: "index_cars_on_made_in"
  add_index "cars", ["model"], name: "index_cars_on_model"
  add_index "cars", ["submodel"], name: "index_cars_on_submodel"
  add_index "cars", ["year"], name: "index_cars_on_year"

  create_table "models", force: true do |t|
    t.string   "brand_name"
    t.integer  "brand_id"
    t.string   "name"
    t.string   "chinese_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "models", ["brand_id"], name: "index_models_on_brand_id"
  add_index "models", ["brand_name"], name: "index_models_on_brand_name"
  add_index "models", ["chinese_name"], name: "index_models_on_chinese_name"
  add_index "models", ["name"], name: "index_models_on_name"

end
