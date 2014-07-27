class ModifyCarsTableDueToCarBelongsToModel < ActiveRecord::Migration
  def change
    remove_column :cars, :brand_id
    remove_column :cars, :model
    remove_column :cars, :chinese_model
    add_column :cars, :model_id, :integer
    add_index :cars, :model_id
  end
end
