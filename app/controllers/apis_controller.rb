class ApisController < ApplicationController
  

	require 'net/http'
	require 'uri'
	require 'json'

	def index
		@brands = Brand.all
		@items = Item.all
		@categorys = Category.all
		
	end


	def updater
		# check categories to see if they exist
		if Category.all.length == 0
			Category.create(name: "Tops")
			Category.create(name: "Bottoms")
			Category.create(name: "Shoes")
			Category.create(name: "Dresses")
			Category.create(name: "Accessories")
			Category.create(name: "Outerwear")
		end
		
		# set initial variables
		@count = 0
		categories = ["womens-tops", "skirts", "womens-pants", "shorts", "womens-shoes", "dresses", "womens-accessories", "womens-outerwear"]
		@category = Category.all

		# make call requests until you have gone through all the categories
		until @count > 7
			# set initial variables for the api calls
			offset = 0
			c = categories[@count]

			# get upto 500 items per category
			until offset >= 500

				# api call
				url = "http://api.shopstyle.com/api/v2/products?pid=uid404-24629898-59&format=JSON&offset=#{offset}&limit=100&cat=#{c}"
				uri = URI.parse(url)
				response = Net::HTTP.get_response(uri)
				value = JSON.parse(response.body)

				# run through each item
				value["products"].each do |product|


				# select a matching item from the database
				@item = Item.where(name: product["name"])
				# simplifies the call for me
				@item = @item[0]	
				


				# check to see if the item exists and if it does that it matches the product name
					if @item != nil && @item.name == product["name"]
						# update the item
						@item.update_attributes(name: product["name"], price: product["price"], photo: product["image"]["sizes"]["IPhone"]["url"], click_url: product["clickUrl"])
					else
						# if it fails it means it's a new item
						Item.create(name: product["name"], price: product["price"], photo: product["image"]["sizes"]["IPhone"]["url"], click_url: product["clickUrl"])
						# set the new item to @item
						@item = Item.last



						# now that we have a new item, add it to a category
						case @count
						when 0 # category is womens-tops from shopstyle
							#add that item into our Tops Category
							@category.all[0].items << @item 
						when 1,2,3 # categories are skirts, womens-pants, shorts from shopstyle
							#add that item into our Bottoms Category
							@category.all[1].items << @item 
						when 4 # category is womens-shoes from shopstyle
							#add that item into our Shoes Category
							@category.all[2].items << @item
						when 5 # category is dresses from shopstyle
							#add that item into our Dresses Category
							@category.all[3].items << @item
						when 6 # category is womens-accessories from shopstyle
							#add that item into our Accessories Category
							@category.all[4].items << @item
						when 7 # category is womens-outerwear from shopstyle
							#add that item into our Outerwear Category
							@category.all[5].items << @item
						end
					end


					# do our brand check
					if product["brand"] != nil 


						# select a matching brand in the database
						@brand = Brand.where(name: product["brand"]["name"])
						# make brand easier for me to read
						@brand = @brand[0]

						# see if the brand already exists in the database
					 	if @brand != nil && @brand.name == product["brand"]["name"]
					 		# add item to the brand
					 			@brand.items << @item
					 	else
					 		# if no brand exists, create one
							Brand.create(name: product["brand"]["name"], items: [@item])
						end
					end

				end
				# increase offset for the api call
				offset += 100
			end #end of offset until loop
			# increase the count so we can move to the next category
			@count += 1
		end #end of api call until loop

		# set pass-through variables for the view
		@brands = Brand.all
		@items = Item.all
		@categorys = Category.all
		render action: "index"
			

			
	end

end
