class Api::V1::GearsController < ApplicationController
    skip_before_action :authorized
    before_action :find_gear, only: [:show, :update, :destroy]


    def index
        gears = Gear.all
        render json: gears, except: [:created_at, :updated_at]
    end

    def show
        render json: @gear, except: [:created_at, :updated_at]
    end

    def new
        gear = Gear.new
    end

    def create
        gear = Gear.create(trip_params)
        if (gear.valid?)
            render json: gear
        else
            render json: { errors: trip.errors.full_messages }, status: :not_acceptable
        end
    end

    def update
        gear.update(gear_params)
        if (gear.valid?)
            render json: gear
        else
            render json: { errors: trip.errors.full_messages, id: trip.id }, status: :not_acceptable
        end
    end

    def destroy
        
        gear.destroy
        render json: gear
    end

    private

    def find_gear
       @gear = Gear.find(params[:id])
    end

    def gear_params
        params.require(:trip).permit(:name, :brand,:notes, :geartype, :url, :icon, :quantity, :retired, :user_id, :weight)
    end
end
