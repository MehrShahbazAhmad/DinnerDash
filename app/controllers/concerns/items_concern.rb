# frozen_string_literal: true

module ItemsConcern
  extend ActiveSupport::Concern

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
