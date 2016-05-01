require "rails_helper"

RSpec.describe ApartmentTypesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/apartment_types").to route_to("apartment_types#index")
    end

    it "routes to #new" do
      expect(:get => "/apartment_types/new").to route_to("apartment_types#new")
    end

    it "routes to #show" do
      expect(:get => "/apartment_types/1").to route_to("apartment_types#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/apartment_types/1/edit").to route_to("apartment_types#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/apartment_types").to route_to("apartment_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/apartment_types/1").to route_to("apartment_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/apartment_types/1").to route_to("apartment_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/apartment_types/1").to route_to("apartment_types#destroy", :id => "1")
    end

  end
end
