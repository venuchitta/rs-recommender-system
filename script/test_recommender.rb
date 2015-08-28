# bundle exec rails runner script/test_recommender.rb

# require 'recommender'
# Recommender.new(User.first.id, :similar_category).recommendations

require 'recommender'
Recommender.new(User.first.id, :similar_purchase).recommendations
