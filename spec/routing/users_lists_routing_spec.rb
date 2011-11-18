require "spec_helper"

describe Users::ListsController do
  describe "routing" do
      
    it "routes to #index" do
      get("/users/lists").should route_to("users/lists#index")
    end

    it "routes to #show" do
      get("/users/lists/1").should route_to("users/lists#show", :id => "1")
    end
    
    it "routes to #new" do
      get("/users/lists/new").should route_to("users/lists#new")
    end

    it "routes to #edit" do
      get("/users/lists/1/edit").should route_to("users/lists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/users/lists").should route_to("users/lists#create")
    end

    it "routes to #update" do
      put("/users/lists/1").should route_to("users/lists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/users/lists/1").should route_to("users/lists#destroy", :id => "1")
    end
  end
end
