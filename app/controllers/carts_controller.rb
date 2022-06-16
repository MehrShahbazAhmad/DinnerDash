# frozen_string_literal: true

class CartsController < ApplicationController
  def show
    @cart = user_signed_in? ? @current_cart : Item.find(session[:cart_id])
  end

  def destroy
    @current_cart.destroy
    session[:cart_id].clear
    redirect_to root_path
  end
end
