#require 'rspec'
require_relative '../rails_helper'
require_relative '../../app/controllers/restaurants_controller'
require_relative '../../app/controllers/reviews_controller'

RSpec.describe Review , type: :model do

  context 'create a restaurant' do
    let!(:restaurant) {Restaurant.create(cuisine: 'K', is_ten_bis: true, address: 'תל אביב', restaurant_name:'מאמא מיה', rating: 0)}
    let!(:restaurant_id) {restaurant.id}

    describe 'One Restaurant created' do
      it 'should have no errors and no rating' do
        expect(restaurant.errors.size).to eq(0)
        expect(restaurant.id).to be > 0
        expect(restaurant.rating).to eq(0)
      end
    end

    context 'add a review' do
      it 'restaurant should have a rating of 3' do
        review1 = Review.create!(user_name: 'Moshe', rating:3, restaurant_id: restaurant_id)
        restaurant.update_rating
        expect(restaurant.rating).to eq(3)
      end
    end

    context 'add 3 reviews' do
      it 'restaurant should have a rating of 1' do
        review1 = Review.create!(user_name: 'Moshe', rating:3, restaurant_id: restaurant_id)
        review2 = Review.create!(user_name: 'Moshe', rating:0, restaurant_id: restaurant_id)
        review3 = Review.create!(user_name: 'Moshe', rating:1, restaurant_id: restaurant_id)
        restaurant.update_rating
        expect(restaurant.reviews.size).to eq(3)
        expect(restaurant.rating).to eq(1)
      end
    end

  end
end
