require 'recommender/strategies/similar_category'
require 'recommender/strategies/similar_user'

class Recommender
  def initialize(user_id, strategy_name)
    @user_id = user_id
    @strategy_name = strategy_name
  end
  
  def recommendations
    strategy_class.new(@user_id).recommendations
  end
  
  private
  
  def strategy_class
    case @strategy_name
    when :category
      Strategies::SimilarCategory
    when :user
      Strategies::SimilarUser
    end
  end

end
