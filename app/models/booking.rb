class Booking < ApplicationRecord
    has_many :passenger_bookings
    has_many :passengers, through: :passenger_bookings
    belongs_to :flight

    accepts_nested_attributes_for :passengers

    before_validation :find_or_create_passengers

    def find_or_create_passengers
        self.passengers = self.passengers.map do |passenger|
            Passenger.find_or_create_by(name: passenger.name, email: passenger.email)
        end
    end
end
