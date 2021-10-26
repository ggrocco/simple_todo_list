# frozen_string_literal: true

class Task < ApplicationRecord
  after_update :notify_task_done

  default_scope { order(:done) }
  belongs_to :list

  def notify_task_done
    return unless done_changed? && done

    builder = FeedBuilders::TaskDone.new(task_id: id)
    ListFeed.create!(list_id: list_id, builder: builder)
  end
end
