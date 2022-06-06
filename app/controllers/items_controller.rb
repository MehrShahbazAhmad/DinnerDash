# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :categories, only: %i[new edit create]
  before_action :find_category_item, only: %i[add_item delete_item]
  before_action :find_category, only: %i[add_item delete_item]
  before_action :find_item, only: %i[show edit destroy update]
  before_action :find_restaurant, only: %i[edit new]

  def index
    @items = Item.all.order(:title)
  end

  def show
    authorize @item
  end

  def new
    @item = Item.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    authorize @item
  end

  def create
    if check_categories
      @item = Item.create(item_params)
      authorize @item
      if @item.id?
        flash[:notice] = 'Item was successfully created'
        redirect_to restaurant_path(@restaurant)
        create_links
      else
        render 'new'
      end
    else
      flash[:notice] = 'Atleast one category required'
      redirect_to new_item_path(restaurant_id: @restaurant)
    end
  end

  def edit
    authorize @item
  end

  def update
    if @item.update(item_params)
      flash[:notice] = 'Item was successfully updated'
      @restaurant = Restaurant.find(params.require(:item)[:restaurant_id])
      redirect_to restaurant_path(@restaurant)
    else
      render 'edit'
    end
  end

  def destroy
    authorize @item
    @item.destroy
    redirect_to root_path
  end

  def add_item
    @category.items << @item
    flash[:notice] = "#{@item.title} has been added"
    redirect_to category_path(@category)
  end

  def delete_item
    if @item.categories.count == 1
      flash[:notice] = "Atleast one category required for #{@item.title}"
    else
      @category.items.destroy(@item)
      flash[:notice] = "#{@item.title} has been removed"
    end
    redirect_to category_path(@category)
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :status, images: [])
  end

  def categories
    @categories = Category.all
  end

  def find_category_item
    @item = Item.find(params[:id])
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def find_category
    @category = Category.find(params[:category_id])
  end

  def check_categories
    @category = params.require(:item)[:categories]
    @restaurant = Restaurant.find(params.require(:item)[:restaurant_id])
    @category.present?
  end

  def create_links
    RestaurantItem.create(item_id: @item.id, restaurant_id: @restaurant.id)
    @category_ids = params.require(:item)[:categories]
    @category_ids.each do |category_id|
      CategoryItem.create(item_id: @item.id, category_id: category_id)
    end
  end
end
