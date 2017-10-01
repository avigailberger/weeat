class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates_presence_of :restaurant_name, :address
  validates :cuisine, inclusion: ['A', 'B', 'K'], presence: true
  validates :is_ten_bis, inclusion: [ true, false ]

  def average_rating
    if (self.reviews).empty?
      return 0
    else
      avgRating = (self.reviews.average(:rating)).round
    end
  end
end

