class AdminsController < ApplicationController
  skip_before_action :authenticate_request, only: [:create] 

    def create
        # byebug

        @admin = Admin.new(admin_params)
        
    
        if @admin.save
          # JwtTokenHelper.encode(user_id: @user.id)
          render json: @admin, status: :created
        else
          render json: @admin.errors, status: :unprocessable_entity
        end
    end
    
      private
    
      def admin_params
        params.permit(:name, :email, :password_digest, :address_line1, :address_line2, :locality, :city, :state, :type)
      end
end
