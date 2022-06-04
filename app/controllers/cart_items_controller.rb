# frozen_string_literal: true

class CartItemsController < ApplicationController
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

  def delete_item
    @cart_item.destroy
    flash[:notice] = "#{@item.title} Removed from the Cart"
    redirect_to carts_path(@cart)
  end

  def clear_cart
    @cart.cart_items.each(&:destroy)
    flash[:notice] = 'Cart has been cleared'
    redirect_to carts_path(@cart)
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :item_id, :cart_id)
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def cart
    @cart = @current_cart
  end

  def cart_item
    @cart_item = @cart.cart_items.find_by(item_id: @item.id)
  end

  def quantity_increment
    if @cart_item.quantity >= 10
      flash[:notice] = 'Item quantity cannot be greater than 10'
    else
      @cart_item.quantity += 1
      @cart_item.sub_total += @item.price
      flash[:notice] = "#{@item.title} quantity incremented in Cart"
    end
  end

  def add_item
    @cart_item = CartItem.new
    @cart_item.cart = @current_cart
    @cart_item.item = @item
    @cart_item.sub_total = @item.price
    flash[:notice] = "#{@item.title} added in Cart"
  end

  def quantity_decrement
    @cart_item.quantity -= 1
    @cart_item.sub_total -= @item.price
    flash[:notice] = "#{@item.title} quantity decremented in Cart"
  end
end
