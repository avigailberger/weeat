#require 'rspec'
require 'rails_helper'
require_relative '../app/controllers/restaurants_controller'

RSpec.describe RestaurantsController , type: :controller do
  context 'with all params' do
    it 'should not raise errors' do
      restaurant = Restaurant.create(cuisine: 'K', is_ten_bis: true, address: 'תל אביב', restaurant_name:'מאמא מיה')
      expect(restaurant.errors.size).to eq(0)
    end
  end

  context 'with no params' do
    #it { should validate_presence_of(:address) }
    it 'should raise 4 errors' do
      restaurant = Restaurant.create
      expect(restaurant.errors.size).to eq(5)
    end
  end




end
