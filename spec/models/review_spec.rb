#require 'rspec'
require_relative '../rails_helper'
require_relative '../../app/controllers/restaurants_controller'
require_relative '../../app/controllers/reviews_controller'

RSpec.describe Review , type: :model do

  context 'create a restaurant' do
    let!(:restaurant) {FactoryGirl.create(:restaurant)}
    let!(:restaurant_id) {restaurant.id}

    context 'add a review' do
      it 'restaurant should have a rating of 3' do
        review1 =   FactoryGirl.create(:review, restaurant_id: restaurant_id, rating: 3)
        expect(restaurant.average_rating).to eq(3)
      end
    end

    context 'add 3 reviews' do
      it 'restaurant should have a rating of 1' do
        review1 =   FactoryGirl.create(:review, restaurant_id: restaurant_id)
        review2 =   FactoryGirl.create(:review, restaurant_id: restaurant_id, rating: 3)
        review3 =   FactoryGirl.create(:review, restaurant_id: restaurant_id, rating: 1)
        expect(restaurant.reviews.size).to eq(3)
        expect(restaurant.average_rating).to eq(1)
      end
    end

  end
end
