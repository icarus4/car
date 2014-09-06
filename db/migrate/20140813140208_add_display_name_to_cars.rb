class AddDisplayNameToCars < ActiveRecord::Migration
  def change
    add_column :cars, :display_name, :string, default: ''
    add_index :cars, :display_name
  end
end
