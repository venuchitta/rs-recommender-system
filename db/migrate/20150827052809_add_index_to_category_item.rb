class AddIndexToCategoryItem < ActiveRecord::Migration
  def change
    add_index :category_items, :category_id, :name => 'category_id_ix'
    add_index :category_items, :item_id, :name => 'item1_id_ix'
  end
end
