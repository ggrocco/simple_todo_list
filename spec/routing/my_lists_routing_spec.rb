require "spec_helper"

describe My::ListsController do
  describe "routing" do
      
    it "routes to #index" do
      get("/my/lists").should route_to("my/lists#index")
    end    
    it "routes to #index" do
      get("/my/lists/favorites").should route_to("my/lists#favorites")
    end

    it "routes to #show" do
      get("/my/lists/1").should route_to("my/lists#show", :id => "1")
    end
    
    it "routes to #new" do
      get("/my/lists/new").should route_to("my/lists#new")
    end

    it "routes to #edit" do
      get("/my/lists/1/edit").should route_to("my/lists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/my/lists").should route_to("my/lists#create")
    end

    it "routes to #update" do
      put("/my/lists/1").should route_to("my/lists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/my/lists/1").should route_to("my/lists#destroy", :id => "1")
    end
  end
end
