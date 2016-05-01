require 'rails_helper'

RSpec.describe "apartment_types/index", type: :view do
  before(:each) do
    assign(:apartment_types, [
      ApartmentType.create!(
        :name => "Name",
        :code => "Code",
        :initial_deposit => "9.99",
        :monthly_rent => "9.99"
      ),
      ApartmentType.create!(
        :name => "Name",
        :code => "Code",
        :initial_deposit => "9.99",
        :monthly_rent => "9.99"
      )
    ])
  end

  it "renders a list of apartment_types" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
