require 'bcrypt'

class User < ActiveRecord::Base
	has_many :likes
	has_many :items, through: :likes
	has_many :liked_items, ->{where(likes:{is_like: true})}, through: :likes, source: :item
	has_many :disliked_items, ->{where(likes:{is_like: false})}, through: :likes, source: :item
	has_many :brands, through: :items
	has_many :categorys, through: :items

	attr_accessor :password

	validates :email, presence: {message: "email must b present"}, uniqueness: {message: "email is already taken"}



	def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email 
      user.image = auth.info.image
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)

			@checkuser = User.where(email: auth[:info][:email])
      if @checkuser.length > 0 && @checkuser[0].email == auth.info.email
        user.id = @checkuser[0].id
        if @checkuser[0].image
          user.image = @checkuser[0].image
        end
        @checkuser[0].update!(first_name: user.first_name, last_name: user.last_name, uid: user.uid, provider: user.provider, image: user.image, oauth_token: user.oauth_token, oauth_expires_at: user.oauth_expires_at)
      else
        user.save!
      end

    end
  end

  before_save :hash_stuff

  def authenticated? (pwd)
    self.hashed_password == BCrypt::Engine.hash_secret(pwd, self.salt)
  end

  private

  def hash_stuff
    if @password != nil
      self.salt = BCrypt::Engine.generate_salt
      self.hashed_password = BCrypt::Engine.hash_secret(@password, self.salt)
      @password = nil
    end
  end

end
