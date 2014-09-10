class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user
      t.belongs_to :parent_comment
      t.text :content
      t.string :comment_on
      t.integer :like_count
      t.boolean :is_hidden

      t.index :user_id
      t.index :comment_on
      t.index :like_count
      t.index :is_hidden
      t.timestamps
    end
  end
end
