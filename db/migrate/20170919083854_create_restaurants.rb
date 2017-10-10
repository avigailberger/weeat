class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :restaurant_name, null: false
      t.string :cuisine, null: false
      t.string :address, null: false

      t.timestamps
    end
  end
end
