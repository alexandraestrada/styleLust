require 'spec_helper'

describe User do
	before :all do
		@time = Time.now
		@valid_attributes = {
			first_name: 'Shaun',
			last_name: 'White',
			email:'alex@alex.com',
			uid: 'hello',
			oauth_token: 'token',
			oauth_expires_at: @time 

		}
		@item_attributes = {
			name: 'Shirt',
			price: 13.5,
			photo: "http://example.jpg",
			click_url: "http://makememoney.com"
		}
	end 

	describe 'validations' do
		context 'see when all attributes are valid' do
			it 'record is valid' do
				expect(User.new(@valid_attributes)).to be_valid
			end
		end
		context 'when email is missing' do
			it 'record is not valid' do
			user = User.new(@valid_attributes.merge(email: ""))
			expect(user).not_to be_valid
			expect(user.errors[:email]).to include "email must b present"
			end
		end
		context 'when email is not unique' do
			it 'record is not valid' do
			user1=User.create(email: "example@example.com")
			user2=User.create(email: "example@example.com")
			expect(user2).not_to be_valid
			expect(user2.errors[:email]).to include "email is already taken"
			end
		end

	end

	describe 'relationships' do
		context '.likes' do
			it 'returns an array of likes' do
				user = User.create(@valid_attributes)
				like = Like.create(user_id: user.id)
				expect(user.likes.last).to eq(like)
			end
		end

		context '.items' do
			it 'returns an array of items' do
				user = User.create(@valid_attributes)
				item = Item.create(@item_attributes)
				Like.create(user_id: user.id, item_id: item.id)
				expect(user.items).to include(item)
			end
		end
		context '.liked_items' do
			it 'returns an array of liked_items' do
				user = User.create(@valid_attributes)
				item = Item.create(@item_attributes)
				item2 = Item.create(@item_attributes)
				Like.create(user_id: user.id, item_id: item.id, is_like: true)
				Like.create(user_id: user.id, item_id: item2.id, is_like: false)
				expect(user.liked_items).not_to include item2
				expect(user.liked_items.count).to eql 1

			end 
		end
		context '.disliked_items' do
			it 'returns an array of liked_items' do
				user = User.create(@valid_attributes)
				item = Item.create(@item_attributes)
				item2 = Item.create(@item_attributes)
				Like.create(user_id: user.id, item_id: item.id, is_like: true)
				Like.create(user_id: user.id, item_id: item2.id, is_like: false)
				expect(user.disliked_items).not_to include item
				expect(user.disliked_items.count).to eql 1

			end 
		end
	end

end
