require "rails_helper"

RSpec.describe AllVotesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/all_votes").to route_to("all_votes#index")
    end

    it "routes to #new" do
      expect(:get => "/all_votes/new").to route_to("all_votes#new")
    end

    it "routes to #show" do
      expect(:get => "/all_votes/1").to route_to("all_votes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/all_votes/1/edit").to route_to("all_votes#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/all_votes").to route_to("all_votes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/all_votes/1").to route_to("all_votes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/all_votes/1").to route_to("all_votes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/all_votes/1").to route_to("all_votes#destroy", :id => "1")
    end
  end
end
