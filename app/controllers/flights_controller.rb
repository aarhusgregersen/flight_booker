class FlightsController < ApplicationController

	def index
		@flights = Flight.all
    @airports = Airport.all.map { |airport| [airport.shortcode, airport.id] }
    @dates = Flight.get_dates
    @passengers = (1..4).map { |p| [  p.to_s + " passenger".pluralize(p), p] }
    @search_results = Flight.search(params)
	end


end
