class FlightsController < ApplicationController
    def index
        if !params[:departure_code] and !params[:arrival_code] and !params[:date]
            @flights = Flight.order(:date)
        else
            departure_id = Airport.find(params[:departure_code]).id
            arrival_id = Airport.find(params[:arrival_code]).id 
            @flights = Flight.where("departure_airport_id = ? and arrival_airport_id = ? and start like ?", departure_id, arrival_id, "%" + params[:dates] + "%")
            
            if @flights.count <= 0
                flash[:notice] = "No flights were found"
            elsif @flights.count == 1
                flash[:notice] = "1 Flight was found"
            else
                flash[:notice] = "#{@flights.count} flights were found"
            end
        end
    end

    def flight_params
        params.require(:flight).permit(:arrival_airport_id, :departure_airport_id, :start, :duration)
    end

end
