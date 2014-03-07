json.hotpicks do |json|       # Gives the root, { hotpicks: ...}
  json.array!(@items) do |hotpick|   # Sets up the array @things, each one in thing
    json.extract! hotpick, :id, :name, :category_id, :brand_id  # Prints id and name of each thing
    json.count_likes hotpick.likes.where(is_like: true).count
    json.image_url asset_url(hotpick.photo)  # Prints :image_url property as full url
    json.click_url asset_url(hotpick.click_url)  # Prints out API url of thing
  end
end