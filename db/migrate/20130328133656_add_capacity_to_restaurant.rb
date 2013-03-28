class AddCapacityToRestaurant < ActiveRecord::Migration
  def change
    change_table :restaurants do |t|
      t.integer :capacity
    end
  end
end
