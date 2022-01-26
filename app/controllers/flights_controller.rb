class FlightsController < ApplicationController
    def index
        flash.discard

        if !nil_params
            @flights = Flight.all

            @flights = @flights.where(departure_airport_id: params[:departure_code]) if !params[:departure_code].empty?

            @flights = @flights.where(arrival_airport_id: params[:arrival_code]) if !params[:arrival_code].empty?

            @flights = @flights.where("start like ?", "%" + params[:dates] + "%") if !params[:dates].empty?
        else
            @flights = nil
        end
    end

    def flight_params
        params.require(:flight).permit(:arrival_airport_id, :departure_airport_id, :start, :duration)
    end

    def nil_params
        params[:departure_code].nil? and params[:arrival_code].nil? and params[:dates].nil?
    end

end
