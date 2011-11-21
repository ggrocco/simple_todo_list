class CreateListsUsersJoin < ActiveRecord::Migration
  def change
    create_table :lists_users, :id => false do |t|
      t.integer :user_id
      t.integer :list_id
    end
  end
end
