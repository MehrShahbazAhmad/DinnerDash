# frozen_string_literal: true

module ItemsConcern
  extend ActiveSupport::Concern

  def categories
    @categories = Category.all
  end

  def find_category_item
    @item = Item.find(params[:id])
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def find_category
    @category = Category.find(params[:category_id])
  end

  def count_items
    flash[:notice] = "No Itme found for #{@parameters}" if @items.count.zero?
    redirect_back(fallback_location: root_path) if @items.count.zero?
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
