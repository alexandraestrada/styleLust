class ItemsController < ApplicationController

	
	# def index
	# 	items_params
	# end

	# def likeClicked
	# 	items_params
	# 	current_user.items << @items[params[:index].to_i-1]
	# 	current_user.update_attributes(items: current_user.items, likes: current_user.likes)
	# 	Like.last.update_attributes(is_liked: true)
	# 	render action: 'index'
	# end

	# def dislikeClicked

	# 	render action: 'index'
	# end

	# def items_params
	# 	if params[:cat].blank?
	# 		@items = Item.all
	# 	else
	# 		if params[:price].blank?
	# 			@items = Category.find_by(name: params[:cat]).items
	# 		else
	# 			@items = Category.find_by(name: params[:cat]).items.where("price < ?", params[:price].to_f)
	# 			if @items.length == 0
	# 				@items = Category.find_by(name: params[:cat]).items
	# 			end
	# 		end
	# 	end
	# 	if params[:index].blank?
	# 		@index = params[:index] = 0
	# 	else
	# 		@index = params[:index].to_i 
	# 		if 	(@items.length < @index + 1)
	# 			@index -= 1
	# 		end
	# 	end
	# end

end
