require 'recommender/strategies/similar_category'

describe Strategies::SimilarCategory do
  
  let(:category) { Strategies::SimilarCategory.new(12234) }
  
  before do
    User.create(name: 'Paul', id: 12234)
    Item.create(name: 'Nike Dunks', id: 1200)
    @item2 = Item.create!(name: 'Nike Street Basketball', id: 1211)
    @item3 = Item.create!(name: 'Addidas Jersey', id: 1233)
    Item.create(name: 'Golf bag', id: 1344)
    Category.create(name: 'shoes', id: 10)
    Category.create(name: 'Basketball', id: 11)
    Category.create(name: 'Nike', id: 12)
    Category.create(name: 'Balls', id: 13)
    Category.create(name: 'Clothing', id: 14)
    Category.create(name: 'Adidas', id: 15)
    Category.create(name: 'Accessories', id: 16)
    Category.create(name: 'Golf', id: 17)
    CategoryItem.create(category_id: 10 ,item_id: 1200)
    CategoryItem.create(category_id: 11 ,item_id: 1200)
    CategoryItem.create(category_id: 12 ,item_id: 1200)
    CategoryItem.create(category_id: 13 ,item_id: 1211)
    CategoryItem.create(category_id: 11 ,item_id: 1211)
    CategoryItem.create(category_id: 12 ,item_id: 1211)
    CategoryItem.create(category_id: 14 ,item_id: 1233)
    CategoryItem.create(category_id: 11 ,item_id: 1233)
    CategoryItem.create(category_id: 15 ,item_id: 1233)
    CategoryItem.create(category_id: 16 ,item_id: 1344)
    CategoryItem.create(category_id: 17 ,item_id: 1344)
    UserItem.create(user_id: 12234, item_id: 1200)
  end
  
  describe '#recommend' do
    it 'varifies if the algorithm is working as per instructions' do
       expect(category.recommendations).to eq([@item2, @item3])
    end
  end

end