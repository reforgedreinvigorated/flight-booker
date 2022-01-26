class Droppassengerbookingtable < ActiveRecord::Migration[6.1]
  def change
    drop_table :passenger_bookings
  end
end
