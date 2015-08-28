class UsersController < ApplicationController
  caches_page :index
  
  class UnknownRecommendationsStrategy < StandardError; end
    
  def index
    @users = User.all.limit(500)
  end
  
  def recommend
    begin
      @items = Recommender.new(params[:user_id], params[:recommend].intern).recommendations
    rescue StandardError => e
      logger.info("Error while displaying the recommended results with #{e.message}")
    end
  end
end
