class AddMoreFieldsToCars < ActiveRecord::Migration
  def change
    add_column :cars, :has_tpms, :boolean
    add_column :cars, :has_ldws, :boolean
    add_column :cars, :has_cruise_control, :boolean
    add_column :cars, :has_afs, :boolean
    add_column :cars, :has_pretension_seat_belt, :boolean
    add_column :cars, :has_attention_assist, :boolean
    add_column :cars, :has_child_safety_lock, :boolean
    add_column :cars, :has_blind_spot_monitor_system, :boolean
    add_column :cars, :has_hill_start_assist, :boolean

    add_column :cars, :iihs_crash_test_link, :string
    add_column :cars, :ncap_crash_test_link, :string
    add_column :cars, :ncap_rating, :integer
    add_column :cars, :spec_url, :string

    add_column :cars, :is_all_data_ready, :boolean

    add_index :cars, :has_tpms
    add_index :cars, :has_ldws
    add_index :cars, :has_cruise_control
    add_index :cars, :has_afs
    add_index :cars, :has_pretension_seat_belt
    add_index :cars, :has_attention_assist
    add_index :cars, :has_child_safety_lock
    add_index :cars, :has_blind_spot_monitor_system
    add_index :cars, :has_hill_start_assist
    add_index :cars, :is_all_data_ready
    add_index :cars, :ncap_rating

  end
end
