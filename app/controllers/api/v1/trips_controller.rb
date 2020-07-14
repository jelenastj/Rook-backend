class Api::V1::TripsController < ApplicationController
    skip_before_action :authorized
    before_action :find_trip, only: [:show, :update, :destroy]


    def index
        trips = Trip.all
        render json: trips, except: [:created_at, :updated_at]
    end

    def show
        render json: @trip, except: [:created_at, :updated_at]
    end

    def new
        trip = Trip.new
    end

    def create
        trip = Trip.create(trip_params)
        if (trip.valid?)
            render json: trip
        else
            render json: { errors: trip.errors.full_messages }, status: :not_acceptable
        end
    end

    def update
      
        trip.update(trip_params)
        if (trip.valid?)
            render json: trip
        else
            render json: { errors: trip.errors.full_messages, id: trip.id }, status: :not_acceptable
        end
    end

    def destroy
        
        trip.destroy
        render json: trip
    end

    private

    def find_trip
       @trip = Trip.find(params[:id])
    end

    def trip_params
        params.require(:trip).permit(:location, :start_date, :end_date, :notes, :user_id, :gear_id)
    end
end
