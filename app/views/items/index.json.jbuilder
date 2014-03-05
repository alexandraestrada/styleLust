json.items do |json|       # Gives the root, { items: ...}
  json.array!(@items) do |item|   # Sets up the array @things, each one in thing
    json.extract! item, :id, :name, :category_id, :brand_id  # Prints id and name of each thing
    json.count_likes item.likes.where(is_like: true).count
    json.image_url asset_url(item.photo)  # Prints :image_url property as full url
    json.click_url asset_url(item.click_url)  # Prints out API url of thing
  end
end