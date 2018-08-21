class AddListOfTimeSlotsToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :available_slots, :integer
  end
end
