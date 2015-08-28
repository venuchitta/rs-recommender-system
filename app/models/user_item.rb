# == Schema Information
#
# Table name: user_items
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  item_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserItem < ActiveRecord::Base  
  scope :select_item_id, -> { select(:item_id) }
  scope :purchased_items, -> item_ids{ where(item_id: item_ids) }
  scope :similar_users, -> user_ids{ where(user_id: user_ids) }
  scope :but_not_in, -> item_id{ where.not(item_id: item_id) }
  scope :group_by_item_id, -> { group(:item_id) }
  scope :order_by_user_id, -> { order('count(user_id) DESC') }
    
  belongs_to :user
  belongs_to :item
end
