require "rails_helper"

RSpec.describe SchoolClassesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/school_classes").to route_to("school_classes#index")
    end

    it "routes to #new" do
      expect(:get => "/school_classes/new").to route_to("school_classes#new")
    end

    it "routes to #show" do
      expect(:get => "/school_classes/1").to route_to("school_classes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/school_classes/1/edit").to route_to("school_classes#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/school_classes").to route_to("school_classes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/school_classes/1").to route_to("school_classes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/school_classes/1").to route_to("school_classes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/school_classes/1").to route_to("school_classes#destroy", :id => "1")
    end
  end
end
