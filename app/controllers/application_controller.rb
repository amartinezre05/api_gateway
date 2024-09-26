class ApplicationController < ActionController::API
    before_action :authorize_request, except: [:login, :register]

    private
  
    def authorize_request
      token = request.headers['Authorization']&.split(' ')&.last
      user_id = AuthService.verify_token(token)
      render json: { errors: 'Unauthorized' }, status: :unauthorized unless user_id
    end
end
