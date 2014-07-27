class RenameBrandToBrandName < ActiveRecord::Migration
  def change
    rename_column :cars, :brand, :brand_name
  end
end
