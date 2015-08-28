require 'spec_helper'
require 'recommender'
require 'recommender/strategies/similar_category'
require 'recommender/strategies/similar_user'

describe 'Recommender' do
  let(:recommender) { Recommender.new(12234, :category) }
  describe '#Recommandations' do
    it 'initializes Id and strategy_name properly' do
      expect_any_instance_of( Strategies::SimilarCategory).to receive(:recommendations).once
      recommender.recommendations
    end
  end

end