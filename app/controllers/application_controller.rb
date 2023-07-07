class ApplicationController < ActionController::API
require 'jwt'
include JsonWebToken
    before_action :authenticate_request
    private
    def authenticate_request 
        begin
        header = request.headers["Authorization"]
        # byebug
            header = header.split(" ").last if header
            decoded = decode(header)
            @current_user = User.find_by_id(decoded[:user_id])
        rescue
            render json: {error: "Unauthorized User"}, status: 400
        
        end
    end

    def check_admin
        if @current_user.type != "Admin"
            render json: {error: "Not Allowed"}
        end
    end


end
# end




#     require 'jwt'
#     before_action :authenticate_request

#   private

#   def authenticate_request
#     header = request.headers['Authorization']
#     if header
#     token = header&.split(' ')&.last
#     decoded = decode_jwt(header)


#     # begin
#     #   decoded = JwtTokenHelper.decode(token)
#     #   @current_user = User.find(decoded['user_id'])
#       @current_user = User.find(decoded[:user_id])

#     # else 
#     #   JWT::DecodeError, ActiveRecord::RecordNotFound
#     #   render json: { error: 'Invalid token' }, status: :unauthorized
#     end
#   end
#   def decode_jwt(token)
#     secret_key = Rails.application.secrets.secret_key_base
#     JWT.decode(token, secret_key, true, algorithm: 'HS256').first
#   end

# #   def authenticate_user!
# #     render json: { error: 'Unauthorized' }, status: :unauthorized unless @current_user
# #   end

#   def current_user
#     @current_user
#   end
# end
