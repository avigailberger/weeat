json.extract! restaurant, :id, :restaurant_name, :cuisine_name, :address, :average_rating, :cuisine_cod
json.url restaurant_url(restaurant, format: :json)
