class RemoveCapacityFromRestaurant < ActiveRecord::Migration
  def up
    remove_column :restaurants, :capacity
  end

  def down
    add_column :restaurants, :capacity, :integer
  end
end
