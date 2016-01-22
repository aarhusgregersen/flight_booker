# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Passenger.delete_all
Booking.delete_all
Airport.delete_all
Flight.delete_all
Ticket.delete_all

nyc = Airport.create(name: "New York City", shortcode: "NYC")
lax = Airport.create(name: "Los Angelos Airport", shortcode: "LAX")
bil = Airport.create(name: "Billund Aiport", shortcode: "BIL")

duration = { "LAX_NYC" => 2.hours, "NYC_LAX" => 2.hours, "LAX_BIL" => 22.hours, "BIL_LAX" => 22.hours, "NYC_BIL" => 16.hours, "BIL_NYC" => 16.hours }

Airport.all.each do |airport1|
	Airport.all.each do |airport2|
		unless airport1 == airport2
			dur = duration["#{airport1.shortcode}_#{airport2.shortcode}"]
			Flight.create(startAirport: airport1.id, finishAirport: airport2.id, date: Time.now, duration: dur)
			Flight.create(startAirport: airport1.id, finishAirport: airport2.id, date: 3.hours.from_now, duration: dur)
			Flight.create(startAirport: airport1.id, finishAirport: airport2.id, date: 6.hours.from_now, duration: dur)
			Flight.create(startAirport: airport1.id, finishAirport: airport2.id, date: 1.day.from_now, duration: dur)
			Flight.create(startAirport: airport1.id, finishAirport: airport2.id, date: (1.day + 6.hours).from_now, duration: dur)
			Flight.create(startAirport: airport1.id, finishAirport: airport2.id, date: 2.days.from_now, duration: dur)
			Flight.create(startAirport: airport1.id, finishAirport: airport2.id, date: (2.days + 3.hours).from_now, duration: dur)
		end
	end
end
