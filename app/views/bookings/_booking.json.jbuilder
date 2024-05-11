json.extract! booking, :id, :roundtrip, :departure_date, :return_date, :departure_airport, :destination_airport, :flight_class, :created_at, :updated_at
json.url booking_url(booking, format: :json)
