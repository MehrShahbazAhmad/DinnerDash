# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :cart

  def show
    calculate_total
  end

  def destroy
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end

  private

  def calculate_total
    @cart.cart_items.each do |cart_items|
      @cart.total += cart_items.sub_total
    end
  end

  def cart
    @cart = @current_cart
  end
end
