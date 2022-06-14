# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :cart, only: [:destroy]

  def show
    @cart = if user_signed_in?
              @current_cart
            else
              Item.find(session[:cart_id])
            end
  end

  def destroy
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end

  private

  def cart
    @cart = @current_cart
  end
end
