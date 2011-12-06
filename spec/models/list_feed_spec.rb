require 'spec_helper'

describe ListFeed do
  before(:each) do
    @listFeed = ListFeed.new( :builder => FeedBuilders::TaskDone.new( :task_id=> 12 ) )
  end
  
  context "#create" do
    it "Is valid with valid arguments" do
      @listFeed.builder.should be_an_instance_of FeedBuilders::TaskDone
    end
    
    it "Is process the attributes before save" do
      @listFeed.save.should be_true
      @listFeed.instance_type.should == "TaskDone"
      @listFeed.instance_data.should == { :task_id=> 12 }
    end
    
    it "Instanceate the builder using the database information" do
      @listFeed.save
      feed_id = @listFeed.id
      
      other_feed = ListFeed.find(feed_id)
      other_feed.builder.should be_an_instance_of FeedBuilders::TaskDone
      other_feed.builder.data.should == { :task_id=> 12 }
    end
  end
end
