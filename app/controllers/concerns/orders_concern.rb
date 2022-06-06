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
    @order.total = 0
    @order.save
    create_order_items
  end

  def create_order_items
    @cart.cart_items.each do |cart_item|
      @order.order_items.create(item_id: cart_item.item.id, order_id: @order.id, quantity: cart_item.quantity,
                                sub_total: cart_item.sub_total)
      cart_item.item.order_count += 1
      cart_item.item.save
    end
    calculate_total
  end

  def all_orders
    @orders = if user_signed_in? && current_user.user?
                current_user.orders
              else
                Order.all
              end
    authorize @orders
  end

  def calculate_total
    @order.order_items.each do |order_item|
      @order.total += order_item.sub_total
    end
    @order.save
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
