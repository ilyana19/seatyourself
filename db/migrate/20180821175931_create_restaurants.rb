class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :neighbourhood
      t.string :address
      t.string :price_range
      t.text :summary
      t.text :menu
      t.integer :owner_id

      t.timestamps
    end
  end
end
