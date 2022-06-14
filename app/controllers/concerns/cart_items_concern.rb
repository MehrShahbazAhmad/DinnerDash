# frozen_string_literal: true

module CartItemsConcern
  extend ActiveSupport::Concern

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :item_id, :cart_id)
  end

  def find_item
    @item = Item.find(params[:item_id]) if user_signed_in?
  end

  def cart
    @cart = @current_cart
  end

  def cart_item
    @cart_item = @cart.cart_items.find_by(item_id: @item.id) if user_signed_in?
  end

  def quantity_increment
    if @cart_item.quantity >= 10
      flash[:notice] = 'Item quantity cannot be greater than 10'
    else
      @cart_item.quantity += 1
      flash[:notice] = "#{@item.title} quantity incremented in Cart"
    end
  end

  def add_item
    @cart_item = CartItem.new
    @cart_item.cart = @current_cart
    @cart_item.item = @item
    flash[:notice] = "#{@item.title} added in Cart"
  end

  def quantity_decrement
    @cart_item.quantity -= 1
    flash[:notice] = "#{@item.title} quantity decremented in Cart"
  end

  def quantity_increment_guest
    id = params[:item_id].to_i
    flash[:notice] = 'Item added in Cart'
    session[:cart_id] << id
  end

  def quantity_decrement_guest
    id = params[:item_id].to_i
    index = session[:cart_id].find_index(id)
    flash[:notice] = 'Item Quantity decremented in Cart'
    session[:cart_id].delete_at(index)
  end

  def remove_item_guest
    id = params[:item_id].to_i
    session[:cart_id].delete(id)
    flash[:notice] = 'Item removed from the Cart'
  end
end
