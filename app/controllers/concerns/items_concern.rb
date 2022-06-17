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

  def check_categories
    category_ids
    @restaurant = Restaurant.find_by(params[:restaurant_id])
    if @category.blank?
      flash[:notice] = 'Atleast one category required'
      redirect_to new_item_path(restaurant_id: @restaurant)
    end
  end

  def create_links
    category_ids
    RestaurantItem.create(item_id: @item.id, restaurant_id: @restaurant.id)
    @category_ids.each do |category_id|
      CategoryItem.create(item_id: @item.id, category_id: category_id)
    end
  end

  def top_three_items
    @items = Item.all.order(:order_count).last(3)
  end

  def count_items
    flash[:notice] = "No Itme found for #{@parameters}" if @items.count.zero?
    redirect_back(fallback_location: root_path) if @items.count.zero?
  end

  def category_ids
    @categories = params.require(:item).permit(:categories)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
