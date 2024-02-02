class ApplicationController < ActionController::API
    include JsonWebToken
    before_action :authenticate_request 
    
    private
    def authenticate_request
        header = request.headers["Authorization"]
        if header.present? && header.split(" ").first == "Bearer"
          token = header.split(" ").last
          decoded = jwt_decode(token)
          if decoded.present? && decoded.key?(:user_id)
            @current_user = User.find(decoded[:user_id])
          else
            render json: { error: "Invalid token" }, status: :unauthorized
          end
        else
          render json: { error: "Authorization header missing or invalid" }, status: :unauthorized
        end
      end
end
