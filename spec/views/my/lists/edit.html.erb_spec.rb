require 'spec_helper'

describe "my/lists/edit.html.erb" do
  before(:each) do
    @list = Factory.create(:other_user).lists.first
    assign(:list,  @list)
  end

  it "renders the edit list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => my_list_path(@list), :method => "post" do
      assert_select "input#list_name", :name => "list[name]"
      assert_select "input#list_private", :name => "list[private]"
      assert_select "input#list_tasks_attributes_0_todo", :name => "list[tasks_attributes][0][todo]"
    end
  end
end
