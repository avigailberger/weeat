class Cuisine < ApplicationRecord
  has_many :restaurants
  validates_presence_of :descriptionE, :descriptionH, :icon
end
