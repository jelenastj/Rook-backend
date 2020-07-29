class Api::V1::TripsController < ApplicationController

    skip_before_action :authorized
    before_action :find_trip, only: [:show, :update, :destroy, :update_gears]


    def index
        trips = Trip.all
        render json: trips.to_json(trips_serializer)
    end

    def show
        render json: @trip.to_json(trips_serializer)
    end

    def new
        trip = Trip.new
    end

    def create
        trip = Trip.create(trip_params)
        if (trip.valid?)
            render json: trip.to_json(trips_serializer)
        else
            render json: { errors: trip.errors.full_messages }, status: :not_acceptable
        end
    end

    def update
        @trip.update(trip_params)
        puts params
        if (@trip.valid?)
            @trip.save
            render json: @trip.to_json(trips_serializer)
        else
            render json: { errors: @trip.errors.full_messages, id: trip.id }, status: :not_acceptable
        end

    end

    def update_gears
        tg = @trip.tripgears.find { |tg| tg.gear_id == params[:gear_id]}
        if (tg.destroy)
            render json: @trip.to_json(trips_serializer)
        else
            render json: { errors: @trip.errors.full_messages, id: trip.id }, status: :not_acceptable
        end

    end

    def destroy
        @trip.destroy
        render json: @trip.to_json(trips_serializer)
    end

    private

    def find_trip
       @trip = Trip.find(params[:id])
       
    end

    def trip_params
        params.require(:trip).permit( :location, :start_date, :end_date, :notes, :user_id)
    end

    def trips_serializer
       {
           :only => [:id, :user_id, :location, :notes, :start_date, :end_date],
           :include => {:gears => { }}
    }
    end
end
