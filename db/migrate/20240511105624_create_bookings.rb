class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.boolean :roundtrip
      t.datetime :departure_date
      t.datetime :return_date
      t.string :departure_airport
      t.string :destination_airport
      t.string :flight_class

      t.timestamps
    end
  end
end
