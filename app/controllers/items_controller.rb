class ItemsController < ApplicationController

		
	def index
		
		respond_to do |format|
      format.html do 	
      	@items = limit_items
      end
      format.json { 
 				@items = Item.find_by_sql("SELECT i.id, i.name, i.price, i.category_id, i.brand_id, i.photo, i.click_url, COUNT(l.item_id) FROM items AS i LEFT OUTER JOIN likes AS l ON i.id = l.item_id WHERE l.is_like = 't' GROUP BY i.id, i.name, i.price, i.category_id, i.brand_id, i.photo, i.click_url ORDER BY COUNT(l.item_id) DESC LIMIT 100;") }
    end
	end


	def create 
		@items = limit_items
		if params[:is_like] == "true"
			likeClicked()
		elsif params[:is_like] == "false"
			dislikeClicked()
		else
			#this is where we will add new items with an api request
			render action: 'index'
		end
		
	end


	def likeClicked
		Like.create(user_id: current_user.id, item_id: @items.first.id, is_like: true)
		@items.shift
		render action: 'index'
	end

	def dislikeClicked
		Like.create(user_id: current_user.id, item_id: @items.first.id, is_like: false)
		@items.shift
		render action: 'index'
	end


private

	def limit_items
		
		@items = Item.all
		@items = @items.joins(:category).where(categories: {name: params[:cat]}) if params[:cat]
		@items = @items.where("items.price < ?", params[:price]) if params[:price]
		
		@items = @items.where.not(id: Item.joins(:likes).where(likes: {user_id: current_user.id}).pluck(:id))
		return @items.to_a

	end


end
