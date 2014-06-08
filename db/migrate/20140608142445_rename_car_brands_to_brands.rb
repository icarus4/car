class RenameCarBrandsToBrands < ActiveRecord::Migration
  def change
    rename_table :car_brands, :brands
  end
end
