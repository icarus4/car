class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|

      t.string :brand_name
      t.integer :brand_id

      t.string :name
      t.string :chinese_name

      t.timestamps
    end

    change_table :models do |t|
      t.index :brand_name
      t.index :brand_id
      t.index :name
      t.index :chinese_name
    end
  end

end
