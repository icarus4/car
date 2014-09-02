class CreateCarEditions < ActiveRecord::Migration
  def change
    create_table :car_editions do |t|
      t.integer :car_id, null: false
      t.integer :user_id, null: false
      t.boolean :is_creation, null: false
      t.index [:car_id, :user_id]
      t.index [:user_id, :car_id]
      t.index :is_creation
      t.timestamps
    end
  end

  # add_index :car_editions, [:car_id, :user_id]
  # add_index :car_editions, [:user_id, :car_id]
  # add_index :car_editions, :is_creation
  # add_index :car_editions, :edited_at
end
