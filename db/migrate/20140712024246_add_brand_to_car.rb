class AddBrandToCar < ActiveRecord::Migration
  def change
    add_column :cars, :brand, :string
    add_index :cars, :brand
  end
end
