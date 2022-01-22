# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#reset databases
Airport.delete_all
Flight.delete_all

codes = ["BHM", "SFO", "NYC", "DHN", "MRI", "SNA", "DEN", "AUS"]

codes.each do |code|
    Airport.create!(code: code)
end

#create 3 flights
# arriving in SFO, NYC, DHN
# departing from MRI, BHM, AUS

arrival = ["SFO", "NYC", "DHN"]
departure = ["MRI", "BHM", "AUS"]

arrival.each_with_index do |code, i|
    starttime = DateTime.now + rand(1..21).days 
    duration = rand(1800..10800)
    arrival_id = Airport.find_by("code = ?", arrival[i]).id
    departure_id = Airport.find_by("code = ?", departure[i]).id

    Flight.create!(arrival_airport_id: arrival_id, departure_airport_id: departure_id, start: starttime, duration: duration)
end


