# frozen_string_literal: true

class ItemsController < ApplicationController
  include ItemsConcern
  before_action :categories, only: %i[new]
  before_action :find_category_item, only: %i[add_item delete_item]
  before_action :find_category, only: %i[add_item delete_item]
  before_action :find_item, only: %i[show edit destroy update]
  before_action :find_restaurant, only: %i[edit new]

  def index
    if params[:search].blank?
      @items = Item.sort_by_title
    else
      @parameters = params[:search].downcase
      @items = Item.search(@parameters)
      count_items
    end
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
    @item = Item.new(item_params)
    authorize @item
    if @item.save
      flash[:notice] = 'Item was successfully created'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    authorize @item
  end

  def update
    if @item.update(item_params)
      flash[:notice] = 'Item was successfully updated'
      @restaurant = Restaurant.find_by(params[:restaurant_id])
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
    @category.items.destroy(@item)
    flash[:notice] = "#{@item.title} has been removed"
    redirect_to category_path(@category)
  end

  def top_items; end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :status, images: [])
  end
end
