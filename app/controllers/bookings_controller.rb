class BookingsController < ApplicationController

	def new
		@flight = Flight.find(params[:flight_id])
		@booking = @flight.bookings.build

		params[:passengers].to_i.times { @booking.passengers.build }
		@booking.passengers.build if params[:passengers].blank? # Builds 1 passenger if user forgets to select
		@numbers = 1
	end

	def create
		@numbers = 1
		@booking = Booking.new(booking_params)
		if @booking.save
		#	@booking.passengers each { |p| PassengerMailer.thank_you_email(p).deliver!}

			redirect_to booking_path(@booking)
		else
			@flight = Flight.find(params[:flight_id])
      flash.now[:danger] = "Make sure the passenger information is correct."
			render 'new'
		end
	end

	def show
		@booking = Booking.find(params[:id])
	end

	private

	def booking_params
		params.require(:booking).permit(:flight_id, :passengers_attributes => [:id, :name, :email])
	end
end
