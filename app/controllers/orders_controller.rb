# frozen_string_literal: true

class OrdersController < ApplicationController
  include OrdersConcern
  before_action :find_order, only: %i[show edit update]
  before_action :all_orders, only: [:index]
  def index
    filter_order
  end

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
end
