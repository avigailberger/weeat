require 'rails_helper'

RSpec.describe "cuisines/edit", type: :view do
  before(:each) do
    @cuisine = assign(:cuisine, Cuisine.create!(
      :id => "",
      :descriptionE => "MyText",
      :descriptionH => "MyText",
      :icon => "MyText"
    ))
  end

  it "renders the edit cuisine form" do
    render

    assert_select "form[action=?][method=?]", cuisine_path(@cuisine), "post" do

      assert_select "input[name=?]", "cuisine[id]"

      assert_select "textarea[name=?]", "cuisine[descriptionE]"

      assert_select "textarea[name=?]", "cuisine[descriptionH]"

      assert_select "textarea[name=?]", "cuisine[icon]"
    end
  end
end
