class FlightsController < ApplicationController

	def index
		@flights = Flight.all
    @airports = Airport.all.map { |airport| [airport.shortcode, airport.id] }
    @dates = Flight.get_dates
    @passengers = (1..4).map { |p| [  p.to_s + " passenger".pluralize(p), p] }

    @search_results = Flight.search(params)

    # @search_results = Flight.where(startAirport: params[:startAirport],
    																# finishAirport: params[:finishAirport],
    																# date: params[:date])
    # if params[:commit] == "Search"
    # 	if params[:startAirport] == params[:finishAirport]
    # 		flash.now[:danger] = "Your departure and arriving airport can not be the same destination."
    # 	end
    # end
	end
end
