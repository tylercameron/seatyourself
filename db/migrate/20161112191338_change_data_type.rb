class ChangeDataType < ActiveRecord::Migration[5.0]
  def change
    change_column :reservations, :date_of_reservation, :string
  end
end
