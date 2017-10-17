#require 'rspec'
require_relative '../rails_helper'
require_relative '../../app/controllers/restaurants_controller'

RSpec.describe RestaurantsController , type: :controller do
  context 'Creating a restaurant' do
    let!(:cuisine) {FactoryGirl.create(:cuisine)}

    context 'through the controller' do
      it 'should have a rating of 0 and not nil, and cuisine code Z' do
        params = {cuisine: cuisine, is_ten_bis: true, address: 'תל אביב', restaurant_name:'מאמא מיה'}
        post :create, params: {restaurant: params}
        expect(response.status).to eq(200)

        restaurant = Restaurant.find_by_restaurant_name('מאמא מיה')
        expect(restaurant.average_rating).to eq(0) # if the post didn't work - this will be nil
        expect(restaurant.cuisine.icon).to eq('Z')

      end
    end
  end
end