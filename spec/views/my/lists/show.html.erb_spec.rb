require 'spec_helper'

describe "my/lists/show.html.erb" do
  before(:each) do
    assign(:list, stub_model(List,
      :name => "Name",
      :private => false
    ))    
    view.stub(:user_signed_in?).and_return(false)
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/public.png/)
  end
end
