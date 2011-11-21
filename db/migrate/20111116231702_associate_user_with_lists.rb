class AssociateUserWithLists < ActiveRecord::Migration
  def change
    add_column :lists, :owner_id, :integer
  end
end
