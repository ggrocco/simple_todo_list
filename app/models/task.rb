class Task < ActiveRecord::Base
  
  after_update :notify_task_done
  
  default_scope order(:done)
  belongs_to :list
  
  def notify_task_done
    if self.done_changed? && self.done
      builder = FeedBuilders::TaskDone.new( :task_id => self.id )
      ListFeed.create!( :list_id => self.list_id, :builder => builder )
    end
  end  
end
