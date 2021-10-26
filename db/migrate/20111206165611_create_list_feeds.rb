# frozen_string_literal: true

class CreateListFeeds < ActiveRecord::Migration[6.1]
  def change
    create_table :list_feeds do |t|
      t.string :instance_type
      t.text :instance_data
      t.belongs_to :list

      t.timestamps
    end
  end
end
