class ChangeColumnNames < ActiveRecord::Migration[5.0]

  def change
    rename_column :reservations, :time, :time_of_reservation
  end
end
