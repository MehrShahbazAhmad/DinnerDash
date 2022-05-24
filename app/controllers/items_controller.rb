# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :find_item, except: %i[index new create]
  def index
    @items = Item.all
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @item = @restaurant.items.new
  end

  def show; end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @item = @restaurant.items.create(item_params)
    redirect_to restaurant_path(@restaurant)
  end

  def edit; end

  def update
    if @item.update(item_params)
      redirect_to @restaurant
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to @restaurant
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :status, images: [])
  end

  def find_item
    @restaurant = Restaurant.find(params[:restaurant_id])
    @item = Item.find(params[:id])
  rescue ActiveRecord::RecordNotFound => error
    redirect_to root_path, notice: error.message
  end
end
