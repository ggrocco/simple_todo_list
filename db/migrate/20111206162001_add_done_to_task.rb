# frozen_string_literal: true

class AddDoneToTask < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :done, :boolean
  end
end
