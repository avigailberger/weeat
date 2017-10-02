json.extract! restaurant, :id, :restaurant_name, :cuisine, :address, :created_at, :average_rating, :updated_at
json.url restaurant_url(restaurant, format: :json)
