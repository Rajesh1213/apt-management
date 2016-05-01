require 'rails_helper'

RSpec.describe "ApartmentTypes", type: :request do
  describe "GET /apartment_types" do
    it "works! (now write some real specs)" do
      get apartment_types_path
      expect(response).to have_http_status(200)
    end
  end
end
