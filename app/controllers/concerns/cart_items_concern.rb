# frozen_string_literal: true

module CartItemsConcern
  extend ActiveSupport::Concern

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
