class ReviewsController < ApplicationController
  before_action :set_restaurant


  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # @review.save!
    # redirect_to review_path(@review)
    @review.restaurant = @restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end


  private

  def review_params
    params.require(:review).permit(:content, :rating, :restaurant_id)

  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
