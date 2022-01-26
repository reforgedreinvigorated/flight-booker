class Createpassengerbooktable < ActiveRecord::Migration[6.1]
  def change
    create_table :passenger_bookings do |t|
      t.belongs_to :passenger
      t.belongs_to :booking
      t.timestamps
    end
  end
end
