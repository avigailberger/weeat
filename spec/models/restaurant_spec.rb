#require 'rspec'
require_relative '../rails_helper'
require_relative '../../app/controllers/restaurants_controller'

RSpec.describe Restaurant , type: :model do
  context 'creating a restaurant' do
    let!(:cuisine) {FactoryGirl.create(:cuisine)}

    context 'restaurant must have an address field' do
      it { should validate_presence_of(:address) }
    end

    context 'creating restaurant with no params' do
      it 'should raise 5 errors' do
        restaurant = Restaurant.create
        expect(restaurant.errors.size).to eq(5)
      end
    end

    context 'creating restaurant' do
      describe 'One Restaurant created' do
        it 'should have no errors and no rating' do
          restaurant = FactoryGirl.create(:restaurant, cuisine: cuisine)
          expect(restaurant.errors.size).to eq(0)
          expect(restaurant.id).to be > 0
          expect(restaurant.average_rating).to eq(0)
          expect(restaurant.cuisine.icon).to eq('Z')
        end
      end
    end
  end
end
