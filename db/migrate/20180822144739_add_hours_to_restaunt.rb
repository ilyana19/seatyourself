class AddHoursToRestaunt < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :opening_hour, :integer
    add_column :restaurants, :closing_hour, :integer
  end
end
