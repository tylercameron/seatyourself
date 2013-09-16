class RemoveEndTimeFromReservation < ActiveRecord::Migration
  def up
    remove_column :reservations, :end_time
  end

  def down
    add_column :reservations, :end_time, :datetime
  end
end
