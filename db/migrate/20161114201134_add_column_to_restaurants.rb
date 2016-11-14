class AddColumnToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :capacity, :integer
  end
end
