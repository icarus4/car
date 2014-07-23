class RemoveBrandNameFromModel < ActiveRecord::Migration
  def change
    remove_column :models, :brand_name
  end
end
