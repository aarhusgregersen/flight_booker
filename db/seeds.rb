# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

airports = [{ name: 'New York City', shortcode: 'NYC' },
						{ name: 'Los Angelos Airport', shortcode: 'LAX' },
						{ name: 'Billund Aiport', shortcode: 'BIL' }]

airports.each do |airport|
	Airport.create( airport)
end

flights = [{ startAirport: 'NYC',  finishAirport: 'LAX' , duration: 2, :startdate => DateTime.strptime("01/01/2016 8:00", "%m/%d/%Y %H:%M")},
					{ startAirport: 'LAX',  finishAirport: 'NYC' , duration: 2,  :startdate => DateTime.strptime("01/22/2016 10:00", "%m/%d/%Y %H:%M")},
					{ startAirport: 'LAX',  finishAirport: 'BIL' , duration: 22, :startdate => DateTime.strptime("01/24/2016 9:00", "%m/%d/%Y %H:%M")},
					{ startAirport: 'BIL',  finishAirport: 'LAX' , duration: 22, :startdate => DateTime.strptime("01/25/2016 17:00", "%m/%d/%Y %H:%M")},
					{ startAirport: 'NYC',  finishAirport: 'BIL' , duration: 16, :startdate => DateTime.strptime("01/31/2016 6:00", "%m/%d/%Y %H:%M")},
					{ startAirport: 'BIL',  finishAirport: 'NYC' , duration: 16, :startdate => DateTime.strptime("01/06/2016 22:00", "%m/%d/%Y %H:%M")}]

flights.each do |flight|
	Flight.create(flight)
end
