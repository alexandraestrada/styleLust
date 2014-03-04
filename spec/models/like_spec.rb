require 'spec_helper'

describe Like do

	before :all do
		@valid_attributes = {
			name: 'Shaun',
			price: 5.99,
			category_id: 3,
			brand_id: 3,
			photo: 'token',
			click_url: 'www.google.com'

		}
	end 
	describe 'validations' do
		context 'see if it is a unique like' do
			it 'record is not valid' do
				user = User.create(email: "example@example.com")
				item = Item.create(@valid_attributes)
				item2 = Item.create(@valid_attributes)
				like1 = Like.create(user_id: user.id, item_id: item.id)
				like2 = Like.create(user_id: user.id, item_id: item.id)
				like3 = Like.create(user_id: user.id, item_id: item2.id)
				expect(like1).to be_valid
				expect(like2).not_to be_valid
				expect(like3).to be_valid

			end
		end
	end
	describe 'relationships' do
		context '.user' do
			it 'returns a user' do
				user = User.create(email: "example@example.com")
				like = Like.create(user_id: user.id)
				expect(like.user).to eq(user)
			end
		end	
		context '.item' do
			it 'returns a item' do
				item = Item.create(@valid_attributes)
				like = Like.create(item_id: item.id)
				expect(like.item).to eq(item)
			end
		end	
	end 

end
