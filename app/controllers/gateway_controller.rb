class GatewayController < ApplicationController
    # POST /register
    def register
        response = AuthService.register(register_params)
        if response.success?
        render json: response.parsed_response, status: :created
        else
        render json: response.parsed_response, status: :unprocessable_entity
        end
    end

    # POST /login
    def login
        response = AuthService.login(login_params)
        if response.success?
        render json: response.parsed_response, status: :ok
        else
        render json: response.parsed_response, status: :unauthorized
        end
    end

    private

    def register_params
        params.permit(:name, :email, :password, :password_confirmation)
    end

    def login_params
        params.permit(:email, :password)
    end
end
