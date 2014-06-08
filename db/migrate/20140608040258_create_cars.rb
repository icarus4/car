class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :model
      t.string :chinese_model
      t.string :submodel
      t.string :chinese_submodel
      t.string :generation
      t.string :made_in
      t.integer :year

      t.integer :displacement
      t.integer :door_num
      t.boolean :is_hybrid
      t.boolean :is_electric_vehicle

      t.integer :airbag_num
      t.boolean :has_airbag_at_driver_front
      t.boolean :has_airbag_at_passenger_front
      t.boolean :has_airbag_at_driver_knee
      t.boolean :has_airbag_at_passenger_knee
      t.boolean :has_airbag_at_center
      t.boolean :has_airbag_for_pedestrian
      t.boolean :has_airbags_at_front_side_torso
      t.boolean :has_airbags_at_rear_side_torso
      t.boolean :has_airbags_at_side_curtain
      t.boolean :has_airbags_at_seat_belt

      t.boolean :has_esp
      t.string  :esp_name

      t.boolean :has_abs
      t.boolean :has_eba
      t.boolean :has_ebd

      t.boolean :has_isofix

      t.timestamps
    end

    change_table :cars do |t|
      t.index :model
      t.index :submodel
      t.index :generation
      t.index :made_in
      t.index :year
      t.index :displacement
      t.index :door_num
      t.index :is_hybrid
      t.index :is_electric_vehicle
      t.index :airbag_num
      t.index :has_airbags_at_side_curtain
      t.index :has_esp
      t.index :has_abs
      t.index :has_eba
      t.index :has_ebd
      t.index :has_isofix
    end
  end
end
