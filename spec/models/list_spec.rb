require 'spec_helper'

describe List do
   before(:each) do
    @list = List.new( :name => "My list")
  end
  
  it "It is valid with valid attributes" do
    @list.should be_valid
  end
  
  it "It is not valid without name" do
    @list.name = nil
    @list.should_not be_valid
    @list.should have(1).error_on(:name)
  end
  
  it "Is possible to add tasks" do
    4.times{ |i| @list.tasks << Task.new(:todo => "Todo #{i}") }   
    @list.tasks.size.should == 4
    @list.should be_valid
  end
  
end
