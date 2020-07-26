class Api::V1::TripgearsController < ApplicationController
    skip_before_action :authorized
    def index
        trip = Trip.find(params[:trip_id])
        render json: trip.gears
    end

    
    # before_action :find_trip, only: [:show, :update, :destroy]


    # def index
    #     tripgears = Tripgear.all
    #     render json: tripgears.to_json(tripgears_serializer)
    # end


    # def create
    #     trip = Trip.create(tripgears_params)
    #     if (trip.valid?)
    #         render json: trip
    #     else
    #         render json: { errors:trip.errors.full_messages }, status: :not_acceptable
    #     end
    # end

    # def update
    #     trip = Trip.find(params[:trip_id])
    #     trip
    # end

    # def show
    #     render json: @tripgear.to_json(tripgears_serializer)
    # end


    private

    # def find_tripgear
    #    @tripgear = Tripgear.find(params[:id])
    # end

    def tripgears_params
        params.require(:tripgear).permit(:gears =>[:name, :brand,:notes, :geartype, :url, :icon, :quantity, :retired, :user_id, :weight])
    end


end
