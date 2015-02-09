require "rails_helper"

RSpec.describe LeadersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/leaders").to route_to("leaders#index")
    end

    it "routes to #new" do
      expect(:get => "/leaders/new").to route_to("leaders#new")
    end

    it "routes to #show" do
      expect(:get => "/leaders/1").to route_to("leaders#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/leaders/1/edit").to route_to("leaders#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/leaders").to route_to("leaders#create")
    end

    it "routes to #update" do
      expect(:put => "/leaders/1").to route_to("leaders#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/leaders/1").to route_to("leaders#destroy", :id => "1")
    end

  end
end
