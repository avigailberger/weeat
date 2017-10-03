class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates_presence_of :restaurant_name, :address, :cuisine_name
  validates :is_ten_bis, inclusion: [ true, false ]

  def average_rating
    if (self.reviews).empty?
      return 0
    else
      avgRating = (self.reviews.average(:rating)).round
    end
  end

  def set_cuisince_code (cuisineName)
    cuisineCode = 'F'
    case cuisineName
      when 'Asian'
        cuisineCode = 'D'
      when 'Burger'
        cuisineCode =  'A'
      when 'Coffee'
        cuisineCode =  'B'
      when 'Fish'
        cuisineCode =  'K'
      when 'Home Food'
        cuisineCode =  'f'
      when 'Hummus'
        cuisineCode =  'n'
      when 'Indian'
        cuisineCode =  '6'
      when 'Italian'
        cuisineCode =  'L'
      when 'Meat'
        cuisineCode =  '3'
      when 'Mexican'
        cuisineCode =  '8'
      when 'Pizza'
        cuisineCode =  'L'
      when 'Salad/Sandwich'
        cuisineCode =  'q'
      when 'Sushi'
        cuisineCode =  'I'
      when 'Vegan'
        cuisineCode =  'H'
    end
    self.cuisine = cuisineCode
  end

end

