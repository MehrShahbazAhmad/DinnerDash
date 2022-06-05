# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :find_order, only: %i[show edit update]
  before_action :all_orders, only: [:index]
  def index; end

  def new
    @order = Order.new
    authorize @order
    create_order
    @cart.cart_items.each(&:destroy)
    flash[:notice] = 'Order has been Confrimed'
    redirect_to root_path
  end

  def show; end

  def edit; end

  def update
    flash[:notice] = 'Order was successfully updated' if @order.update(order_params)
    redirect_to orders_path
  end

  private

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
end
