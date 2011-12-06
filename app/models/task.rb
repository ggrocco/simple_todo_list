class Task < ActiveRecord::Base
  default_scope order(:done)
  belongs_to :task_group
end
