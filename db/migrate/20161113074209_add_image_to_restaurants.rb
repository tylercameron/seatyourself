class AddImageToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :image, :string
  end
end
