require 'rails_helper'

RSpec.describe Cuisine, type: :model do
  context 'creating a cuisine' do
    let!(:cuisine) {FactoryGirl.create(:cuisine)}

    context 'cuisine must have an icon field' do
      it { should validate_presence_of(:icon) }
    end
  end
end
