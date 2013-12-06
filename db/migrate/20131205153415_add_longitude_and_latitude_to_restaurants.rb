class AddLongitudeAndLatitudeToRestaurants < ActiveRecord::Migration
  def change
    change_table :restaurants do |t|
      t.decimal :longitude, precision: 9, scale: 6
      t.decimal :latitude, precision: 9, scale: 6
    end
  end
end
