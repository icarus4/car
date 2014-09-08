class AddIndexToUidAndTokenToUsers < ActiveRecord::Migration
  def change
    add_index :users, :uid
    add_index :users, :token
  end
end
