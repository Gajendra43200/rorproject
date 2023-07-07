# app/controllers/services_controller.rb
class ServicesController < ApplicationController
   before_action :check_admin, only:[:create, :update,:show, :services_with_names]
    def create
      service = @current_user.services.new(service_params)
      if service.save
        render json:  service, status: :created
      else
        render json: {error: @service.errors.full_messages}, status: :unprocessable_entity
      end
    end
    def update
      byebug
      service = @current_user.services.find_by_id(params[:id])
      
      if service.update(service_params)
        render json: service, status: :ok
      else
        render json: { error: service.errors.full_messages }, status: :unprocessable_entity
      end
    end
    def show
     if  service = Service.find(params[:id])
        render json: service, status: :ok
      else
        render json: { error: "Unauthorized" }, status: :unauthorized
      end
    end

    def services_with_names
      # if services = Service.pluck(:id, :name)
      # byebug
      if services = Service.find_by_name(params[:name])


        render json: services, status: :ok
      else
        render json: { error: "Unauthorized" }, status: :unauthorized
      end
    end

    def index
      services = Service.all 
      render json: services, status: :ok
    end

    
    
    private
    def service_params
      params.permit(:name, :status, :address)
    end
  end
  



    # def index
    #   if params[:city].present?
    #     @services = Service.where(city: params[:city])
    #   elsif params[:latitude].present? && params[:longitude].present?
    #     @services = Service.near([params[:latitude], params[:longitude]], 5) # Adjust the distance as per your requirement
    #   else
    #     @services = Service.all
    #   end
  
    #   render json: @services
    # end
  
    # def sort_by_rating
    #   @services = Service.order(rating: :desc)
    #   render json: @services
    # end
  
    # def filter_by_rating
    #   if params[:min_rating].present? && params[:max_rating].present?
    #     @services = Service.where(rating: params[:min_rating]..params[:max_rating])
    #   else
    #     @services = Service.all
    #   end
  
    #   render json: @services
    # end