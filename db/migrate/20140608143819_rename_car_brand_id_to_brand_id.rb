class RenameCarBrandIdToBrandId < ActiveRecord::Migration
  def change
    rename_column :cars, :car_brand_id, :brand_id
  end
end
