json.extract! restaurant, :id, :restaurant_name, :cuisine_id, :address, :average_rating, :cuisine
json.url restaurant_url(restaurant, format: :json)
