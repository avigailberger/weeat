require 'csv'
=begin

#creating cuisine list
#Cuisine.delete_all
cuisineCounter = 0
Cuisine.create(descriptionE: 'Asian', descriptionH: 'אסיתי', icon: 'D')
#check if has been created
cuisine = Cuisine.find_by_descriptionE('Asian')
if cuisine.nil?
  puts "error creating cuisine: #{response.status}"
else
  cuisineCounter +=1
end
Cuisine.create(descriptionE: 'Burger', descriptionH: 'המבורגרים', icon: 'A')
#check if has been created
cuisine = Cuisine.find_by_descriptionE('Burger')
if cuisine.nil?
  puts "error creating cuisine: #{response.status}"
else
  cuisineCounter +=1
end
Cuisine.create(descriptionE: 'Coffee', descriptionH: 'קפה', icon: 'B')
#check if has been created
cuisine = Cuisine.find_by_descriptionE('Coffee')
if cuisine.nil?
  puts "error creating cuisine: #{response.status}"
else
  cuisineCounter +=1
end
Cuisine.create(descriptionE: 'Fish', descriptionH: 'דגים', icon: 'K')
#check if has been created
cuisine = Cuisine.find_by_descriptionE('Fish')
if cuisine.nil?
  puts "error creating cuisine: #{response.status}"
else
  cuisineCounter +=1
end
Cuisine.create(descriptionE: 'Home Food', descriptionH: 'אוכל ביתי', icon: 'f')
#check if has been created
cuisine = Cuisine.find_by_descriptionE('Home Food')
if cuisine.nil?
  puts "error creating cuisine: #{response.status}"
else
  cuisineCounter +=1
end
Cuisine.create(descriptionE: 'Hummus', descriptionH: 'חומוס', icon: 'n')
#check if has been created
cuisine = Cuisine.find_by_descriptionE('Hummus')
if cuisine.nil?
  puts "error creating cuisine: #{response.status}"
else
  cuisineCounter +=1
end
Cuisine.create(descriptionE: 'Indian', descriptionH: 'הודי', icon: '6')
#check if has been created
cuisine = Cuisine.find_by_descriptionE('Indian')
if cuisine.nil?
  puts "error creating cuisine: #{response.status}"
else
  cuisineCounter +=1
end
Cuisine.create(descriptionE: 'Italian', descriptionH: 'איטלקי', icon: 'L')
#check if has been created
cuisine = Cuisine.find_by_descriptionE('Italian')
if cuisine.nil?
  puts "error creating cuisine: #{response.status}"
else
  cuisineCounter +=1
end
Cuisine.create(descriptionE: 'Meat', descriptionH: 'בשרים', icon: '3')
#check if has been created
cuisine = Cuisine.find_by_descriptionE('Meat')
if cuisine.nil?
  puts "error creating cuisine: #{response.status}"
else
  cuisineCounter +=1
end
Cuisine.create(descriptionE: 'Mexican', descriptionH: 'מקסיקני', icon: '8')
#check if has been created
cuisine = Cuisine.find_by_descriptionE('Mexican')
if cuisine.nil?
  puts "error creating cuisine: #{response.status}"
else
  cuisineCounter +=1
end
Cuisine.create(descriptionE: 'Pizza', descriptionH: 'פיצה', icon: 'L')
#check if has been created
cuisine = Cuisine.find_by_descriptionE('Pizza')
if cuisine.nil?
  puts "error creating cuisine: #{response.status}"
else
  cuisineCounter +=1
end
Cuisine.create(descriptionE: 'Salad/Sandwich', descriptionH: 'סלטים/סנדוויצים', icon: 'q')
#check if has been created
cuisine = Cuisine.find_by_descriptionE('Salad/Sandwich')
if cuisine.nil?
  puts "error creating cuisine: #{response.status}"
else
  cuisineCounter +=1
end
Cuisine.create(descriptionE: 'Sushi', descriptionH: 'סושי', icon: 'I')
#check if has been created
cuisine = Cuisine.find_by_descriptionE('Sushi')
if cuisine.nil?
  puts "error creating cuisine: #{response.status}"
else
  cuisineCounter +=1
end
Cuisine.create(descriptionE: 'Vegan', descriptionH: 'טבעוני', icon: 'H')
#check if has been created
cuisine = Cuisine.find_by_descriptionE('Vegan')
if cuisine.nil?
  puts "error creating cuisine: #{response.status}"
else
  cuisineCounter +=1
end
puts "finished creating #{cuisineCounter} cuisines"
=end


Restaurant.delete_all
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
  lat = row[6]
  lng = row[5]

  #creating the restaurant
  cuisine = Cuisine.find_by_descriptionE(cuisine_name)
  if cuisine.nil?
    puts 'error non existent cuisine, cannot create restaurant'
  else
    params = {cuisine: cuisine, is_ten_bis: is_ten_bis, address: address, restaurant_name: restaurant_name, lat: lat, lng: lng}
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
  end
  rowCounter +=1
end

puts "finished creating #{restaurantCounter} restaurants"



