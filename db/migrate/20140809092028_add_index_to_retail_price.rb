class AddIndexToRetailPrice < ActiveRecord::Migration
  def change
    add_index :cars, :retail_price
  end
end
