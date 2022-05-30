# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :find_item, except: %i[index new create]
  before_action :find_restaurant, only: %i[new create]
  def index
    @items = Item.all
  end

  def new
    @item = @restaurant.items.new
  end

  def show; end

  def create
    @item = @restaurant.items.create(item_params)
    if @item.save
      @item.category_ids = (params.require(:item)[:categories])
      redirect_to restaurant_path(@restaurant)
    else
      render 'new'
    end
  end

  def edit
    @category = Category.all
  end

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

  def find_restaurant
    @category = Category.all
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def find_item
    @restaurant = Restaurant.find(params[:restaurant_id])
    @item = @restaurant.items.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    redirect_to root_path, notice: e.message
  end
end
