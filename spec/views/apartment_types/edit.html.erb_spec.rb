require 'rails_helper'

RSpec.describe "apartment_types/edit", type: :view do
  before(:each) do
    @apartment_type = assign(:apartment_type, ApartmentType.create!(
      :name => "MyString",
      :code => "MyString",
      :initial_deposit => "9.99",
      :monthly_rent => "9.99"
    ))
  end

  it "renders the edit apartment_type form" do
    render

    assert_select "form[action=?][method=?]", apartment_type_path(@apartment_type), "post" do

      assert_select "input#apartment_type_name[name=?]", "apartment_type[name]"

      assert_select "input#apartment_type_code[name=?]", "apartment_type[code]"

      assert_select "input#apartment_type_initial_deposit[name=?]", "apartment_type[initial_deposit]"

      assert_select "input#apartment_type_monthly_rent[name=?]", "apartment_type[monthly_rent]"
    end
  end
end
