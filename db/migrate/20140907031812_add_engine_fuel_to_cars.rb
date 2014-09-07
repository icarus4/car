class AddEngineFuelToCars < ActiveRecord::Migration
  def change
    add_column :cars, :engine_fuel, :string
    add_index :cars, :engine_fuel
  end
end
