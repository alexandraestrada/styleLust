class Item < ActiveRecord::Base
  belongs_to :category
  belongs_to :brand
  has_many :likes
  has_many :users, through: :likes
  validates :name, presence: {message: "name must be present"}
  validates :price, presence: {message: "price must be present"}
  #validates :category_id, presence: {message: "category_id must be present"}
  #validates :brand_id, presence: {message: "brand_id must be present"}
  validates :photo, presence: {message: "photo must be present"}
  validates :click_url, presence: {message: "click_url must be present"}

end
