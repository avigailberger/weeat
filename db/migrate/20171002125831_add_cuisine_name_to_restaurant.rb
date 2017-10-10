class AddCuisineNameToRestaurant < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :cuisine_name, :string, null: false
  end
end
