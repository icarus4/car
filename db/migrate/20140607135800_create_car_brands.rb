class CreateCarBrands < ActiveRecord::Migration
  def change
    create_table :car_brands do |t|
      t.string :brand
      t.string :parent_company
      t.string :website_tw
      t.string :website_global
      t.string :headquarters

      t.timestamps
    end
    add_index :car_brands, :brand, unique: true
    add_index :car_brands, :parent_company
    add_index :car_brands, :headquarters
  end
end
