class User < ActiveRecord::Base
	has_many :likes
	has_many :items, through: :likes
	validates :email, presence: {message: "email must b present"}, uniqueness: {message: "email is already taken"}

end
