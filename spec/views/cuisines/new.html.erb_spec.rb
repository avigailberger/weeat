require 'rails_helper'

RSpec.describe "cuisines/new", type: :view do
  before(:each) do
    assign(:cuisine, Cuisine.new(
      :id => "",
      :descriptionE => "MyText",
      :descriptionH => "MyText",
      :icon => "MyText"
    ))
  end

  it "renders new cuisine form" do
    render

    assert_select "form[action=?][method=?]", cuisines_path, "post" do

      assert_select "input[name=?]", "cuisine[id]"

      assert_select "textarea[name=?]", "cuisine[descriptionE]"

      assert_select "textarea[name=?]", "cuisine[descriptionH]"

      assert_select "textarea[name=?]", "cuisine[icon]"
    end
  end
end
