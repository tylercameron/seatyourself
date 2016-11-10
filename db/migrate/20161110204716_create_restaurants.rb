class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :description
      t.string :cuisine
      t.string :price
      t.string :street_address
      t.string :neighbourhood
      t.integer :phone

      t.timestamps
    end
  end
end
