class RestaurantSerializer < ActiveModel::Serializer

  attributes :id,
             :restaurant_name,
             :cuisine,
             :cuisine_name,
             :address,
             :is_ten_bis,
             :average_rating


  def scheme
    object.scheme.name
  end

  def average_rating
    Restaurant.average_rating
  end
end
