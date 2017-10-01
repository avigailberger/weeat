class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :user_name , null: false
      t.string :remark
      t.integer :rating, null: false
      t.belongs_to :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
