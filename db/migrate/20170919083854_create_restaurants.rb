class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :restaurant_name
      t.string :cuisine
      t.integer :rating
      t.string :address

      t.timestamps
    end
  end
end
