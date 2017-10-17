class AddFkToRestaurant < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :cuisine_id, :integer, nul: false
    add_foreign_key :restaurants, :cuisines
    remove_column :restaurants, :cuisine_name
  end
end
