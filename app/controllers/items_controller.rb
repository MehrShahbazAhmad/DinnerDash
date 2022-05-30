# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :find_item, except: %i[index new create add_item delete_item]
  before_action :find_restaurant, only: %i[new create]
  before_action :find_category, only: %i[add_item delete_item]
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
      flash[:notice] = 'Item was successfully created'
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
      flash[:notice] = 'Item was successfully Updated'
      redirect_to @restaurant
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to @restaurant
  end

  def add_item
    @category.items << @item
    redirect_to category_path(@category)
  end

  def delete_item
    if @item.categories.count == 1
      flash[:notice] = "Atleast one category required for #{@item.title}"
    else
      @category.items.destroy(@item)
    end
    redirect_to category_path(@category)
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :status, images: [], category_ids: [])
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

  def find_category
    @category = Category.find(params[:category_id])
    @item = Item.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    redirect_to root_path, notice: e.message
  end
end
