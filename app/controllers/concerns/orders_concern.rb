# frozen_string_literal: true

module OrdersConcern
  extend ActiveSupport::Concern

  def order_params
    params.require(:order).permit(:status)
  end

  def find_order
    @order = Order.find(params[:id])
    authorize @order
  end

  def create_order
    @order.user_id = @cart.user_id
    @order.save
    create_order_items
  end

  def create_order_items
    @cart.cart_items.each do |cart_item|
      @order.order_items.create(item_id: cart_item.item.id, order_id: @order.id, quantity: cart_item.quantity)
      cart_item.item.order_count += 1
      cart_item.item.save
    end
  end

  def all_orders
    @orders = if user_signed_in? && current_user.user?
                current_user.orders
              else
                Order.all
              end
    authorize @orders
  end

  def filter_order
    if params[:status].blank?
      @orders
    else
      @parameters = params[:status]
      @orders = Order.find_by(status: @parameters) unless @parameters == 'all'
    end
  end
end
