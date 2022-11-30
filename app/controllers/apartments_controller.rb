class ApartmentsController < ApplicationController

    before_action :set_apartment, only: [:update, :destroy]

    def index
        render json: Apartment.all, status: :ok
    end

    def create
        apartment = Apartment.create!(apartment_params)
        render json: apartment, status: :created
    end

    def update
        @apartment.update!(apartment_params)
        render json: @apartment, status: :accepted
    end 

    def destroy
        @apartment.leases.destroy_all
        @apartment.destroy
        render json: {}
    end

    private

    def apartment_params
        params.permit(:number)
    end

    def set_apartment
        @apartment = Apartment.find(params[:id])
    end
end
