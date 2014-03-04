class ItemsController < ApplicationController

		
	def index
		@items = items_params
	end

	def create 
		items_params
		if params[:is_like] == true
			likeClicked()
		elsif params[:is_like] == false
			dislikeClicked()
		else
			#this is where we will add new items with an api request
		end
			
	end


	def likeClicked
		Like.create(user_id: current_user.id, item_id: @items.first, is_liked: true)
		@items.shift
		render action: 'index'
	end

	def dislikeClicked
		Like.create(user_id: current_user.id, item_id: @items.first, is_liked: false)
		@items.shift
		render action: 'index'
	end


private

	def items_params
		if params[:cat].blank?
			@items = Item.all
		else
			if params[:price].blank?
				@items = Category.find_by(name: params[:cat]).items
			else
				@items = Category.find_by(name: params[:cat]).items.where("price < ?", params[:price].to_f)
				if @items.length == 0
					@items = Category.find_by(name: params[:cat]).items
				end
			end
		end

		return limit_array(@items)


	end

	def limit_array(array)
		current_user.items.each do |item|
			array.delete(item)
		end
		return array
	end

end
