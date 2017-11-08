class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show]


  def index
    @restaurants = Restaurant.all
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    # @restaurant.save!
    # redirect_to restaurant_path(@restaurant)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def new
    @restaurant = Restaurant.new
  end


  def show
    @reviews = Review.where(restaurant_id: @restaurant.id) # params[:id]
  end


  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end

end
