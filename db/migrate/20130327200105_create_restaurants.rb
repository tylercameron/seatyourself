class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :picture
      t.text :description
      t.references :category

      t.timestamps
    end
    add_index :restaurants, :category_id
  end
end
