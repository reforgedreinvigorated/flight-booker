class BookingsController < ApplicationController
    def new
        if params[:tickets].empty?
            flash[:alert] = "You must select the number of passengers before you can book a flight"
            redirect_to root_path
        else
            @flight = Flight.find(params[:flight_id])
            @booking = Booking.new
            params[:tickets].to_i.times {@booking.passengers.build}
        end
    end

    def create
        @flight = Flight.find(params[:booking][:flight_id])
        @booking = Booking.new(booking_params)
        if @booking.save!
            flash[:notice] = "Created booking"
            redirect_to @booking
        else
            flash[:alert] = "Failed to create booking"
        end

    end

    def show
        @booking = Booking.find(params[:id])
    end

    def booking_params
        params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
    end

end
