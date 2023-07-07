class CustomersController < ApplicationController
  skip_before_action  :authenticate_request, only: [:create] 
 before_action :check_customer

    def create
       byebug
        customer = Customer.new(customer_params)
        if customer.save
          render json: customer, status: :created
        else
          render json: customer.errors.full_messages, status: :unprocessable_entity
        end
      end

      def index
        services = Service.all 
        render json: services, status: :ok
      end

      def search_service
        byebug
        services = Service.find_by_name(params[:name])
        render json: services, status: :ok
      end
      


    
    
      private

    def check_customer
      if @current_user.type != "Customer"
          render json: {error: "Not Allowed"}
      end
    end
    
      def customer_params
        params.permit(:name, :email, :password_digest, :address_line1, :address_line2, :locality, :city, :state, :type)
      end
end
