class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.belongs_to :arrival_airport, foreign_key: {to_table: :airports}
      t.belongs_to  :departure_airport, foreign_key: {to_table: :airports}
      t.datetime :start
      t.time :duration
      t.timestamps
    end
  end
end
