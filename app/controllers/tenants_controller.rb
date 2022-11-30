class TenantsController < ApplicationController
    before_action :set_tenant, only: [:update, :destroy]

    def index
       render json: Tenant.all, status: :ok 
    end

    def create
        tenant = Tenant.create!(tenant_params)
        render json: tenant, status: :created
    end

    def update
        @tenant.update!(tenant_params)
        render json: @tenant, status: :accepted
    end

    def destroy
        @tenant.leases.destroy_all
        @tenant.destroy
        render json: {}
    end

    private

    def set_tenant
        @tenant = Tenant.find(params[:id])
    end

    def tenant_params
        params.permit(:name, :age)
    end
end
