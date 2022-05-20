class RestaurantsController < ApplicationController
  def index
    @restaurant = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path
    else
      render 'new'
    end
  end

  def edit
    @restaurant = Restaurant.find_by_id(params[:id])
  end

  def update
    @restaurant = Restaurant.find_by_id(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to restaurants_path
    else
      render 'new'
    end
  end

  def destroy
    @restaurant = Restaurant.find_by_id(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def restaurant_params()
    params.require(:restaurant).permit(:title)
  end
end
