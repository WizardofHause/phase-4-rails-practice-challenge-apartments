class LeasesController < ApplicationController

    before_action :set_lease, only: [:update, :destroy]

    def create
        lease = Lease.create!(lease_params)
        render json: lease, status: :created
    end

    def update
        @lease.update!(lease_params)
        render json: @lease, status: :accepted
    end

    def destroy
        @lease.destroy
        head :no_content
    end

    private

    def set_lease
        @lease = Lease.find(params[:id])
    end

    def lease_params
        params.permit(:rent, :apartment_id, :tenant_id)
    end
end
