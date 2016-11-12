class ChangeColumnNames2 < ActiveRecord::Migration[5.0]
  def change
      rename_column :reservations, :date, :date_of_reservation
  end
end
