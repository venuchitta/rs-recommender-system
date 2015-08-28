# == Schema Information
#
# Table name: category_items
#
#  id          :integer          not null, primary key
#  category_id :integer
#  item_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CategoryItem < ActiveRecord::Base
  scope :select_item_id, -> { select(:item_id) }
  scope :purchased_items, -> item_id{ where(item_id: item_id) }
  scope :similar_categories, -> category_ids{ where(category_id: category_ids) }
  scope :but_not_in, -> item_id{ where.not(item_id: item_id) }
  scope :group_by_item_id, -> { group(:item_id) }
  scope :order_by_category_id, -> { order('count(category_id) DESC') }
  
  belongs_to :item
  belongs_to :category
end
