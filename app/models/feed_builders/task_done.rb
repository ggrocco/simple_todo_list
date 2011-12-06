module FeedBuilders
  class TaskDone
    
    attr_reader :associations
    attr_accessor :data  
    
    def initialize(args)
      @data = args
    end
    
    def preload(eager)
      @associations = eager
      @associations.load( :task, @data[:task_id])
    end
    
    def message
      task = @associations.get(:task)
      "#{task.todo.inspect} was DONE!"
    end
  end
end