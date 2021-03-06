# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#reset databases
Flight.delete_all
Airport.delete_all

codes = ["BHM", "SFO", "NYC", "DHN", "MRI", "SNA", "DEN", "AUS"]

codes.each do |code|
    Airport.create!(code: code)
end
flightdates = []

codes.length.times do
    flightdates.push(DateTime.now + rand(1..365).days)
end

codes.each_with_index do |code, idx|
    i = 0
    rand_flight_count = rand(1..12)
    while i < rand_flight_count
        duration = rand(1800..10800)
    
        j = rand(0...codes.length)
        until j != idx
            j = rand(0...codes.length)
        end
        starttime = flightdates[j]
        arrival_id = Airport.find_by("code = ?", codes[j]).id
        departure_id = Airport.find_by("code = ?", code).id
    

        Flight.create!(arrival_airport_id: arrival_id, departure_airport_id: departure_id, start: starttime, duration: duration)
        i += 1
    end
end


