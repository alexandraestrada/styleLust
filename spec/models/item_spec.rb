require 'spec_helper'

describe Item do

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
		context 'see when all attributes are valid' do
			it 'record is valid' do
				expect(Item.new(@valid_attributes)).to be_valid
			end
		end
		context 'when name is missing' do
			it 'record is not valid' do
			item = Item.new(@valid_attributes.merge(name: ""))
			expect(item).not_to be_valid
			expect(item.errors[:name]).to include "name must be present"
			end
		end
		context 'when price is missing' do
			it 'record is not valid' do
			item = Item.new(@valid_attributes.merge(price: ""))
			expect(item).not_to be_valid
			expect(item.errors[:price]).to include "price must be present"
			end
		end
		context 'when category_id is missing' do
			it 'record is not valid' do
			item = Item.new(@valid_attributes.merge(category_id: ""))
			expect(item).not_to be_valid
			expect(item.errors[:category_id]).to include "category_id must be present"
			end
		end
		context 'when brand_id is missing' do
			it 'record is not valid' do
			item = Item.new(@valid_attributes.merge(brand_id: ""))
			expect(item).not_to be_valid
			expect(item.errors[:brand_id]).to include "brand_id must be present"
			end
		end
		context 'when photo is missing' do
			it 'record is not valid' do
			item = Item.new(@valid_attributes.merge(photo: ""))
			expect(item).not_to be_valid
			expect(item.errors[:photo]).to include "photo must be present"
			end
		end
		context 'when click_url is missing' do
			it 'record is not valid' do
			item = Item.new(@valid_attributes.merge(click_url: ""))
			expect(item).not_to be_valid
			expect(item.errors[:click_url]).to include "click_url must be present"
			end
		end
	end
	describe 'relationships' do 
		context '.likes' do
			it 'returns an array of likes' do
				item = Item.create(@valid_attributes)
				like = Like.create(item_id: item.id)
				expect(item.likes.last).to eq(like)
			end
		end
		context '.users' do
			it 'returns an array of users' do
				item = Item.create(@valid_attributes)
				user = User.create(email: "example@example.com")
				like = Like.create(item_id: item.id, user_id: user.id)
				expect(item.users.last).to eq(user)
			end
		end
		context '.brand' do
			it 'returns an array of brand' do
				brand = Brand.create(name: "marc jacobs")
				item = Item.create(@valid_attributes.merge(brand_id: brand.id))
				expect(item.brand).to eq(brand)
			end
		end
		context '.category' do
			it 'returns an array of category' do
				category = Category.create(name: "marc jacobs")
				item = Item.create(@valid_attributes.merge(category_id: category.id))
				expect(item.category).to eq(category)
			end
		end
	end
end
