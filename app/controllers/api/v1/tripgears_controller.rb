class Api::V1::TripgearsController < ApplicationController
    skip_before_action :authorized
    def index
        tripgears = Tripgear.all
        render json: tripgears, except: [:created_at, :updated_at]
    end

    def show
        render json: @tripgear, except: [:created_at, :updated_at]
    end

end
