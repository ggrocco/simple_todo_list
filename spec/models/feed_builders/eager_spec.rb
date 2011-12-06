require 'spec_helper'

describe FeedBuilders::Eager do
  before(:all) do
    @eager = FeedBuilders::Eager.new
    user = Factory.create(:other_user)
    @list = user.lists.first
    @task = @list.tasks.first
  end
  
  before(:each) do
    @proxy = @eager.proxy
    @proxy.load(:task, @list.id)
  end
  
  it "the proxy can get a item from db" do
    proxy_task = @proxy.get(:task)
    proxy_task.should == @task
  end
end