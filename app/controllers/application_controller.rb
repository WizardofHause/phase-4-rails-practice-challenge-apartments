class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_response

    private

    def not_found_response(exception)
        render json: { errors: "#{exception.model} not found"}, status: :not_found
    end

    def unprocessable_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
end
