module Strategies
  class SimilarCategory
    def initialize(user_id)
      @user_id = user_id
    end
    
    def recommendations
      get_recommendations
    end
    
    private
    
    def get_recommendations
      purchased_items = User.find(@user_id).items
      purchased_item_ids = purchased_items.map(&:id)
      purchased_items_category_ids = purchased_items.map(&:category_ids).flatten
      
      category_items = CategoryItem.select_item_id.but_not_in(purchased_item_ids).similar_categories(
            purchased_items_category_ids).group_by_item_id.order_by_category_id.map(&:item) 
    end
  end
end
