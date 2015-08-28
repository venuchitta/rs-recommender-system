require 'rails_helper'

describe UsersController, type: :controller do

  let(:valid_attributes) { {id: 12311, name: 'John'} }

  describe 'GET index' do        
    it 'assigns @Users with all the users' do
      user = User.create!(id: 12311, name: 'John')
      get :index, {}
      expect(User.last.id).to eq(user.id)
      expect(User.last.name).to eq(user.name)
    end
  end
  
end