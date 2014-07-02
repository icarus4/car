class AddRetailPriceToCar < ActiveRecord::Migration
  def change
    add_column :cars, :retail_price, :integer
  end
end
