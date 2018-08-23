class AddPartyRangeColumnsToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :min_party_size, :integer, default: 1
    add_column :restaurants, :max_party_size, :integer, default: 10
  end
end
