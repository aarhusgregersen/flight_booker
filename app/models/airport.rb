class Airport < ActiveRecord::Base
	has_many :departing_flights, 	:foreign_key => "startAirport", 	:class_name => "Flight"
	has_many :arriving_flights, 	:foreign_key => "finishAirport", 	:class_name => "Flight"


end
