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

ActiveRecord::Schema.define(version: 20140831094813) do

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
    t.boolean  "has_airbags_at_front"
    t.boolean  "has_airbag_at_driver_knee"
    t.boolean  "has_airbag_at_passenger_knee"
    t.boolean  "has_airbag_at_front_center"
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
    t.float    "retail_price"
    t.string   "brand_name"
    t.integer  "model_id"
    t.boolean  "has_tpms"
    t.boolean  "has_lane_departure_warning_system"
    t.boolean  "has_cruise_control"
    t.boolean  "has_afs"
    t.boolean  "has_pretension_seat_belt"
    t.boolean  "has_attention_assist"
    t.boolean  "has_child_safety_lock"
    t.boolean  "has_blind_spot_monitor_system"
    t.boolean  "has_hill_start_assist"
    t.string   "iihs_crash_test_link"
    t.string   "ncap_crash_test_link"
    t.integer  "ncap_rating"
    t.string   "spec_url"
    t.boolean  "has_brake_override_system"
    t.boolean  "has_city_safety_system"
    t.boolean  "has_adaptive_cruise_control"
    t.boolean  "has_lane_keeping_assist"
    t.boolean  "has_driver_alert"
    t.boolean  "has_collision_warning_and_auto_brake"
    t.text     "note"
    t.boolean  "is_published",                         default: true
    t.boolean  "is_locked",                            default: false
    t.string   "display_name",                         default: ""
  end

  add_index "cars", ["airbag_num"], name: "index_cars_on_airbag_num"
  add_index "cars", ["brand_name"], name: "index_cars_on_brand_name"
  add_index "cars", ["displacement"], name: "index_cars_on_displacement"
  add_index "cars", ["display_name"], name: "index_cars_on_display_name"
  add_index "cars", ["door_num"], name: "index_cars_on_door_num"
  add_index "cars", ["generation"], name: "index_cars_on_generation"
  add_index "cars", ["has_abs"], name: "index_cars_on_has_abs"
  add_index "cars", ["has_adaptive_cruise_control"], name: "index_cars_on_has_adaptive_cruise_control"
  add_index "cars", ["has_afs"], name: "index_cars_on_has_afs"
  add_index "cars", ["has_airbags_at_side_curtain"], name: "index_cars_on_has_airbags_at_side_curtain"
  add_index "cars", ["has_attention_assist"], name: "index_cars_on_has_attention_assist"
  add_index "cars", ["has_blind_spot_monitor_system"], name: "index_cars_on_has_blind_spot_monitor_system"
  add_index "cars", ["has_brake_override_system"], name: "index_cars_on_has_brake_override_system"
  add_index "cars", ["has_child_safety_lock"], name: "index_cars_on_has_child_safety_lock"
  add_index "cars", ["has_city_safety_system"], name: "index_cars_on_has_city_safety_system"
  add_index "cars", ["has_collision_warning_and_auto_brake"], name: "index_cars_on_has_collision_warning_and_auto_brake"
  add_index "cars", ["has_cruise_control"], name: "index_cars_on_has_cruise_control"
  add_index "cars", ["has_driver_alert"], name: "index_cars_on_has_driver_alert"
  add_index "cars", ["has_eba"], name: "index_cars_on_has_eba"
  add_index "cars", ["has_ebd"], name: "index_cars_on_has_ebd"
  add_index "cars", ["has_esp"], name: "index_cars_on_has_esp"
  add_index "cars", ["has_hill_start_assist"], name: "index_cars_on_has_hill_start_assist"
  add_index "cars", ["has_isofix"], name: "index_cars_on_has_isofix"
  add_index "cars", ["has_lane_departure_warning_system"], name: "index_cars_on_has_lane_departure_warning_system"
  add_index "cars", ["has_lane_keeping_assist"], name: "index_cars_on_has_lane_keeping_assist"
  add_index "cars", ["has_pretension_seat_belt"], name: "index_cars_on_has_pretension_seat_belt"
  add_index "cars", ["has_tpms"], name: "index_cars_on_has_tpms"
  add_index "cars", ["is_electric_vehicle"], name: "index_cars_on_is_electric_vehicle"
  add_index "cars", ["is_hybrid"], name: "index_cars_on_is_hybrid"
  add_index "cars", ["is_locked"], name: "index_cars_on_is_locked"
  add_index "cars", ["is_published"], name: "index_cars_on_is_published"
  add_index "cars", ["made_in"], name: "index_cars_on_made_in"
  add_index "cars", ["model_id"], name: "index_cars_on_model_id"
  add_index "cars", ["ncap_rating"], name: "index_cars_on_ncap_rating"
  add_index "cars", ["retail_price"], name: "index_cars_on_retail_price"
  add_index "cars", ["submodel"], name: "index_cars_on_submodel"
  add_index "cars", ["year"], name: "index_cars_on_year"

  create_table "models", force: true do |t|
    t.integer  "brand_id"
    t.string   "name"
    t.string   "chinese_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "models", ["brand_id"], name: "index_models_on_brand_id"
  add_index "models", ["chinese_name"], name: "index_models_on_chinese_name"
  add_index "models", ["name"], name: "index_models_on_name"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "user_level",             default: 3,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "admin",                  default: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
