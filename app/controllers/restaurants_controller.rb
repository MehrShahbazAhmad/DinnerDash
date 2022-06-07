# frozen_string_literal: true

class RestaurantsController < ApplicationController
  before_action :find_restaurant, except: %i[index new create]
  def index
    @restaurants = Restaurant.all
    authorize @restaurants
  end

  def new
    @restaurant = Restaurant.new
    authorize @restaurant
  end

  def show; end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    authorize @restaurant
    if @restaurant.id
      flash[:notice] = 'Restaurant was successfully created'
      redirect_to restaurants_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @restaurant.update(restaurant_params)
      flash[:notice] = 'Restaurant was successfully updated'
      redirect_to restaurants_path
    else
      render 'edit'
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:title)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end
end
