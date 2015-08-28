# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Item < ActiveRecord::Base  
  has_many :category_items
  has_many :categories, through: :category_items
  
  has_many :user_items
  has_many :users, through: :user_items
end
