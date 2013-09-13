class AddPeopleToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :people, :integer, :default => 1
  end
end
