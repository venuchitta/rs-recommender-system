module Strategies
  class SimilarUser
    def initialize(user_id)
      @user_id = user_id
    end
    
    def recommendations
      get_recommendations
    end
    
    private

    def get_recommendations
      purchased_item_ids = User.find(@user_id).item_ids
      similar_purchasers_ids = UserItem.purchased_items(purchased_item_ids).map(&:user_id)          
      UserItem.select_item_id.similar_users(similar_purchasers_ids).but_not_in(purchased_item_ids).group_by_item_id.
            order_by_user_id.map(&:item)    
    end
  end
end
