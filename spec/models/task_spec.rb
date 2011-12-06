require 'spec_helper'

describe Task do
  describe "#create" do
    before(:each) do
      @task = Task.new( :todo => "Do something..." )
    end
    
    it "It new are not done." do
      @task.done.should be_false
    end
  end
  
  describe "#Update" do
    before(:each) do
      user = Factory(:other_user)
      @list = user.lists.first
      @task = @list.tasks.first
    end
    
    it "Has create notify after change to done" do
       expect {
          @task.done = true
          @task.save!
        }.to change(@list.list_feeds, :count).by(1)
    end
    
  end
end
