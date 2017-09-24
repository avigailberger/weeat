class AddIsTenBisToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :is_ten_bis, :bool
  end
end
