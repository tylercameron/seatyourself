class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.date :date
      t.time :time
      t.integer :number_of_seats
      t.integer :user_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
