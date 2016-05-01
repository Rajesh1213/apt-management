require 'rails_helper'

RSpec.describe "apartment_types/show", type: :view do
  before(:each) do
    @apartment_type = assign(:apartment_type, ApartmentType.create!(
      :name => "Name",
      :code => "Code",
      :initial_deposit => "9.99",
      :monthly_rent => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
