class AddIsLockedAndIsPublishedToCars < ActiveRecord::Migration
  def change
    add_column :cars, :is_published, :boolean, default: true
    add_column :cars, :is_locked, :boolean, default: false

    add_index :cars, :is_published
    add_index :cars, :is_locked

    remove_column :cars, :is_all_data_ready
  end
end
