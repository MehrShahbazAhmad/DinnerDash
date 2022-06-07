# frozen_string_literal: true

class CartItemsController < ApplicationController
  include CartItemsConcern
  before_action :find_item, :cart_item, except: %i[clear_cart]
  before_action :cart

  def add_quantity
    if @cart.items.include?(@item)
      quantity_increment
    else
      add_item
    end
    @cart_item.save
    redirect_to carts_path(@cart)
  end

  def reduce_quantity
    if @cart_item.quantity == 1
      @cart_item.destroy
      flash[:notice] = "#{@item.title} Removed from the Cart"
    else
      quantity_decrement
    end
    @cart_item.save
    redirect_to carts_path(@cart)
  end

  def remove_item
    @cart_item.destroy
    flash[:notice] = "#{@item.title} Removed from the Cart"
    redirect_to carts_path(@cart)
  end

  def clear_cart
    @cart.cart_items.each(&:destroy)
    flash[:notice] = 'Cart has been cleared'
    redirect_to carts_path(@cart)
  end
end
