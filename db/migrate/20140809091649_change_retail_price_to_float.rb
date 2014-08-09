class ChangeRetailPriceToFloat < ActiveRecord::Migration
  def change
    change_column :cars, :retail_price, :float
  end
end
