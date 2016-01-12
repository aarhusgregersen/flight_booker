class FlightsController < ApplicationController

	def index
		@flights = Flight.all
	end

	def startdate
    startdate.strftime("%m/%d/%Y")
  end

  private

  def flight_params
  	params[:flight].permit(:startAirport, :finish_airport, :duration, :startdate)
  end

end
