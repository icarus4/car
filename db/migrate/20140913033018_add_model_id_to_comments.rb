class AddModelIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :model_id, :integer
    add_index :comments, :model_id
  end
end
