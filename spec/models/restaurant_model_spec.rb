#require 'rspec'
require_relative '../rails_helper'
require_relative '../../app/controllers/restaurants_controller'

RSpec.describe Restaurant , type: :model do
  context 'creating restaurant must have an address field' do
    it { should validate_presence_of(:address) }
  end

  context 'creating restaurant with no params' do
    it 'should raise 5 errors' do
      restaurant = Restaurant.create
      expect(restaurant.errors.size).to eq(5)
      expect(restaurant.rating).to be_nil # this is set only in controller
    end
  end

end
