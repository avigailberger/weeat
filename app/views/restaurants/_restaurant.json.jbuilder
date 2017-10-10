json.extract! restaurant, :id, :restaurant_name, :cuisine, :cuisine_name, :address, :average_rating
json.url restaurant_url(restaurant, format: :json)
