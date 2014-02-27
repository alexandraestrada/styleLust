class Category < ActiveRecord::Base
	has_many :items
	has_many :likes, through: :items, class_name: 'Like'
	has_many :users, through: :likes, class_name: 'User'

end
