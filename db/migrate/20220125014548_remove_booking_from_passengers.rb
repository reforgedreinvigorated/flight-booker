class RemoveBookingFromPassengers < ActiveRecord::Migration[6.1]
  def change
    change_table :bookings do |t|
      t.remove_references :passenger
    end
  end
end
