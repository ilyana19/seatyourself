class RemoveIsOwnerColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :is_owner, :boolean
  end
end
