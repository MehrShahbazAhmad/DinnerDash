# frozen_string_literal: true

class CartItemsController < ApplicationController
  include CartItemsConcern
  before_action :find_item, :cart_item, except: %i[clear_cart]
  before_action :cart

  def add_quantity
    if user_signed_in?
      if @cart.items.include?(@item)
        quantity_increment
      else
        add_item
      end
      @cart_item.save
    else
      quantity_increment_guest
    end
    redirect_to carts_path(@cart)
  end

  def reduce_quantity
    if user_signed_in?
      if @cart_item.quantity == 1
        @cart_item.destroy
        flash[:notice] = "#{@item.title} Removed from the Cart"
      else
        quantity_decrement
      end
      @cart_item.save
    else
      quantity_decrement_guest
    end
    redirect_to carts_path(@cart)
  end

  def remove_item
    if user_signed_in?
      @cart_item.destroy
      flash[:notice] = "#{@item.title} Removed from the Cart"
    else
      remove_item_guest
    end
    redirect_to carts_path(@cart)
  end

  def clear_cart
    if user_signed_in?
      @cart.cart_items.each(&:destroy)
      flash[:notice] = 'Cart has been cleared'
    else
      session[:cart_id] = []
    end
    redirect_to carts_path(@cart)
  end
end
