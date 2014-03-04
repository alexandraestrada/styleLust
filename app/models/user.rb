class User < ActiveRecord::Base
	has_many :likes
	has_many :items, through: :likes
	validates :email, presence: {message: "email must b present"}, uniqueness: {message: "email is already taken"}
	has_many :liked_items, ->{where(likes:{is_like: true})}, through: :likes, source: :item
	has_many :disliked_items, ->{where(likes:{is_like: false})}, through: :likes, source: :item

end
