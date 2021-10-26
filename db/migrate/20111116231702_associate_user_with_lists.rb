# frozen_string_literal: true

class AssociateUserWithLists < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :owner_id, :integer
  end
end
