class AddMaxCapacityToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :max_capacity, :integer
  end
end
