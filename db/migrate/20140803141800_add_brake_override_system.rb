class AddBrakeOverrideSystem < ActiveRecord::Migration
  def change
    add_column :cars, :has_brake_override_system, :boolean
    add_index :cars, :has_brake_override_system
  end
end
