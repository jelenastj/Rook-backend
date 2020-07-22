class Api::V1::TripgearsController < ApplicationController
    skip_before_action :authorized
    before_action :find_trip, only: [:show, :update, :destroy]


    def index
        tripgears = Tripgear.all
        render json: tripgears, except: [:created_at, :updated_at]
    end


    def create
        tripgear = Tripgear.create(tripgear_params)
        if (tripgear.valid?)
            render json: tripgear.to_json(tripsgear_serializer)
        else
            render json: { errors: tripgear.errors.full_messages }, status: :not_acceptable
        end
    end


    def show
        render json: @tripgear, except: [:created_at, :updated_at]
    end


    private

    def find_tripgear
       @tripgear = Tripgear.find(params[:id])
    end

    def tripgear_params
        params.require(:tripgear).permit(:trip_id, :gear_id)
    end


end
