require 'rails_helper'

RSpec.describe "cuisines/index", type: :view do
  before(:each) do
    assign(:cuisines, [
      Cuisine.create!(
        :id => "",
        :descriptionE => "MyText",
        :descriptionH => "MyText",
        :icon => "MyText"
      ),
      Cuisine.create!(
        :id => "",
        :descriptionE => "MyText",
        :descriptionH => "MyText",
        :icon => "MyText"
      )
    ])
  end

  it "renders a list of cuisines" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
