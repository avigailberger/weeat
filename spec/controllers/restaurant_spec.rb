#require 'rspec'
require_relative '../rails_helper'
require_relative '../../app/controllers/restaurants_controller'

RSpec.describe RestaurantsController , type: :controller do

  context 'Creating a restaurant through the controller' do
    it 'should have a rating of 0 and not nil' do
      params = {cuisine_name: 'Asian', is_ten_bis: true, address: 'תל אביב', restaurant_name:'מאמא מיה'}
      post :create, params: {restaurant: params}
      expect(response.status).to eq(302)

      restaurant = Restaurant.find_by_restaurant_name('מאמא מיה')
      expect(restaurant.average_rating).to eq(0) # if the post didn't work - this will be nil

    end
  end
end