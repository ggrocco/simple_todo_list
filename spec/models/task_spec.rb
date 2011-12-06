require 'spec_helper'

describe Task do
  before(:each) do
    @task = Task.new( :todo => "Do something..." )
  end
  
  describe "#create" do
    it "It new are not done." do
      @task.done.should be_false
    end
  end
end
