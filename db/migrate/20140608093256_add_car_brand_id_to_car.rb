class AddCarBrandIdToCar < ActiveRecord::Migration
  def change
    add_column :cars, :car_brand_id, :integer
    add_index :cars, :car_brand_id
  end
end
