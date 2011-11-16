require 'spec_helper'

describe "lists/edit.html.erb" do
  before(:each) do
    @list = assign(:list, stub_model(List,
      :name => "MyString",
      :private => false
    ))
  end

  it "renders the edit list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lists_path(@list), :method => "post" do
      assert_select "input#list_name", :name => "list[name]"
      assert_select "input#list_private", :name => "list[private]"
    end
  end
end
