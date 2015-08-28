require 'recommender/strategies/similar_user'

describe Strategies::SimilarUser do
    
  before do
    User.create(name: 'Paul', id: 12234)
    User.create(name: 'Joe', id: 12235)
    User.create(name: 'Tim', id: 12236)
    @item1 = Item.create(name: 'Nike Dunks', id: 1200)
    @item2 = Item.create!(name: 'Nike Street Basketball', id: 1211)
    @item3 = Item.create!(name: 'Golf bag', id: 1233)
    UserItem.create(user_id: 12234, item_id: 1200)
    UserItem.create(user_id: 12235, item_id: 1200)
    UserItem.create(user_id: 12235, item_id: 1211)
    UserItem.create(user_id: 12236, item_id: 1211)
    UserItem.create(user_id: 12236, item_id: 1233)
  end
  
  describe '#recommend' do
    it 'varifies if the algorithm is working for user1' do
       category = Strategies::SimilarUser.new(12234) 
       expect(category.recommendations).to eq([@item2])
    end
    
    it 'varifies if the algorithm is working for user2' do
       category = Strategies::SimilarUser.new(12235) 
       expect(category.recommendations).to eq([@item3])
    end
    
    it 'varifies if the algorithm is working for user3' do
       category = Strategies::SimilarUser.new(12236) 
       expect(category.recommendations).to eq([@item1])
    end
  end

end