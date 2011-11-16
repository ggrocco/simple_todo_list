require 'spec_helper'

describe "lists/index.html.erb" do
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
  end

  it "renders a list of lists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
