class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :restaurant_name, :address, presence: true
  validates :cuisine, inclusion: ['A','B', 'K'], presence: true
  validates :is_ten_bis, inclusion: [ true, false ], presence: true

  def update_rating
      avgRating = (self.reviews.average(:rating)).round
      self.rating = avgRating
      self.save
  end
end
