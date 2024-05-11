class CreateFlightSearches < ActiveRecord::Migration[7.1]
  def change
    create_table :flight_searches do |t|

      t.timestamps
    end
  end
end
