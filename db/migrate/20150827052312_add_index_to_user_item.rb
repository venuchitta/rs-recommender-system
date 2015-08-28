class AddIndexToUserItem < ActiveRecord::Migration
  def change
    add_index :user_items, :user_id, :name => 'user_id_ix'
    add_index :user_items, :item_id, :name => 'item_id_ix'
  end
end
