class ChangeOwnerIdtoUserId < ActiveRecord::Migration[5.2]
  def change
    rename_column :restaurants, :owner_id, :user_id
  end
end
