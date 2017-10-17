require 'rails_helper'

RSpec.describe "cuisines/show", type: :view do
  before(:each) do
    @cuisine = assign(:cuisine, Cuisine.create!(
      :id => "",
      :descriptionE => "MyText",
      :descriptionH => "MyText",
      :icon => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
