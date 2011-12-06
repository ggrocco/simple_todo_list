require 'spec_helper'

describe "my/lists/index.html.erb" do
  before(:each) do
    assign(:lists, [
      stub_model(List,
        :name => "Name",
        :private => false
      ),
      stub_model(List,
        :name => "Name",
        :private => false
      )
    ])
    
     assign(:list_feeds, [])
    
    view.stub(:user_signed_in?).and_return(false)
  end

  it "renders a list of lists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "div.list_name", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "img[src=/assets/public.png]", :count => 2
  end
end
