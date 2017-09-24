json.extract! review, :id, :user_name, :remark, :rating, :restaurant_id, :created_at, :updated_at
json.url review_url(review, format: :json)
