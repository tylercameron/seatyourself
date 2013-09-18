class ReaddCapacityToRestaurant < ActiveRecord::Migration

  def change
    change_table :restaurants do |t|
      t.integer :capacity, :default => 100
    end
  end

end
