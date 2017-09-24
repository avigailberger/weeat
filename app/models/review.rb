class Review < ApplicationRecord
  belongs_to :restaurant
  validates :user_name, :restaurant_id, presence: true
  validates :rating, inclusion: { in: 0..3 }, presence: true
end
