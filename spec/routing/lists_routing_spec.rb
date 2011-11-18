require "spec_helper"

describe ListsController do
  describe "routing" do
     
    it "routes to #index" do
      get("/lists").should route_to("lists#index")
    end

    it "routes to #show" do
      get("/lists/1").should route_to("lists#show", :id => "1")
    end
    
  end
end
