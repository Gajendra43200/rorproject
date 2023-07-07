# app/controllers/reviews_controller.rb
class ReviewsController < ApplicationController
  #  skip_before_action  :check_admin
   before_action :authenticate_request
  
    # POST /services/:service_id/reviews
    def create
      # @service = Service.find(params[:service_id])
      # @review = @service.reviews.new(review_params.merge(user_id: current_user.id))
  
      # if @review.save
      #   render json: @review, status: :created
      # else
      #   render json: @review.errors, status: :unprocessable_entity
      # end
      # byebug
      # @service=Service.find_by_id(params[:id])
      @review =@current_user.reviews.new(review_params)
      if @review.save
        render json:@review
      else
        render json: {error: @review.errors.full_messages}
      end
    end
  
    private
  
    def review_params
      params.permit(:rating, :content, :service_id)
    end
  end
  