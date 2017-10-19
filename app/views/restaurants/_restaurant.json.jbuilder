json.extract! restaurant, :id, :restaurant_name, :cuisine_id, :address, :average_rating, :cuisine, :lat, :lng
json.url restaurant_url(restaurant, format: :json)
