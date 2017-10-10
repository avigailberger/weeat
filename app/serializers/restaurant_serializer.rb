=begin
class RestaurantSerializer < ActiveModel::Serializer

  attributes :id,
             :restaurant_name,
             :cuisine_name,
             :address,
             :is_ten_bis,
             :cuisine_code,
             :average_rating,


  def scheme
    object.scheme.name
  end

  def average_rating
    object.average_rating
  end

  def cuisine_code
    object.cuisine_cod
  end
end
=end
