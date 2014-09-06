class AddMoreColumnsToCarsAndRemoveSomeColumns < ActiveRecord::Migration
  def change
    add_column :cars, :has_city_safety_system, :boolean, null: true
    add_index :cars, :has_city_safety_system

    add_column :cars, :has_adaptive_cruise_control, :boolean, null: true
    add_index :cars, :has_adaptive_cruise_control

    add_column :cars, :has_lane_keeping_assist, :boolean, null: true
    add_index :cars, :has_lane_keeping_assist

    add_column :cars, :has_driver_alert, :boolean, null: true
    add_index :cars, :has_driver_alert

    add_column :cars, :has_collision_warning_and_auto_brake, :boolean, null: true
    add_index :cars, :has_collision_warning_and_auto_brake

    add_column :cars, :note, :text, null: true

    rename_column :cars, :has_ldws, :has_lane_departure_warning_system

  end
end
