require 'csv'

#Restaurant.delete_all
restaurantCounter = 0
rowCounter = 0
CSV.foreach("tmp/Restaurants-ALL.csv", :headers => true) do |row|
  #puts "checking row: #{rowCounter}"

  #getting params needed
  restaurant_name = row[0]
  cuisine_name = row[2]
  address = row[7]
  is_ten_bis = true
  if row[4] != 'checked'
   is_ten_bis = false
  end

  #creating the restaurant
  params = {cuisine_name: cuisine_name, is_ten_bis: is_ten_bis, address: address, restaurant_name:restaurant_name}
  restaurant = Restaurant.new(params)
  restaurant.save

  #check if has been created
  restaurant = Restaurant.find_by_restaurant_name(restaurant_name)
  if restaurant.nil?
    puts "error creating restaurant: #{response.status}"
  else
    puts "created restaurant #{restaurant_name} id: #{restaurant.id.to_s}"
    restaurantCounter +=1
  end
  rowCounter +=1
end

puts "finished creating #{restaurantCounter} restaurants"



