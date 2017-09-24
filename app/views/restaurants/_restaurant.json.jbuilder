json.extract! restaurant, :id, :restaurant_name, :cuisine, :rating, :address, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
