class CreateCuisines < ActiveRecord::Migration[5.1]
  def change
    create_table :cuisines do |t|
      t.text :descriptionE, null: false
      t.text :descriptionH, null: false
      t.text :icon, null: false

      t.timestamps
    end
  end
end
