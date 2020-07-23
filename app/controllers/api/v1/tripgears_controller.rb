class Api::V1::TripgearsController < ApplicationController
    def index
        trip = Trip.find(params[:trip_id])
        render json: trip.gears
    end

    # skip_before_action :authorized
    # before_action :find_trip, only: [:show, :update, :destroy]


    # def index
    #     tripgears = Tripgear.all
    #     render json: tripgears.to_json(tripgears_serializer)
    # end


    # def create
    #     tripgear = Tripgear.create(tripgear_params)
    #     if (tripgear.valid?)
    #         render json: tripgear.to_json(tripgears_serializer)
    #     else
    #         render json: { errors: tripgear.errors.full_messages }, status: :not_acceptable
    #     end
    # end


    # def show
    #     render json: @tripgear.to_json(tripgears_serializer)
    # end


    # private

    # def find_tripgear
    #    @tripgear = Tripgear.find(params[:id])
    # end

    # def tripgear_params
    #     params.require(:tripgear).permit(:trip_id, :gear_id)
    # end

    # def tripgears_serializer
    #     {
    #         :only => [:trip_id, :gear_id],
    #         :include => {:gear => { }}
    #  }
    #  end
end
