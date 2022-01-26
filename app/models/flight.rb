class Flight < ApplicationRecord
    belongs_to :arrival_airport, class_name: "Airport"
    belongs_to :departure_airport, class_name: "Airport"
    has_many :bookings
    has_many :passengers, through: :bookings

    def self.get_distinct_flight_dates
        flight_dates = Flight.find_by_sql("select start from Flights").map{ |d| flight_date_formatted(d.start)}.uniq
    end

    def self.flight_date_formatted(date)
        date.strftime("%Y-%m-%d")
    end

    def self.duration_formatted(duration)
        total_minutes = duration / 60
        hours = total_minutes / 60
        minutes = total_minutes % 60

        "#{hours} Hours " + "#{minutes} Minutes"
    end
end
