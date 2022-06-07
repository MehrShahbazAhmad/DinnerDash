# frozen_string_literal: true

module ApplicationsConcern
  extend ActiveSupport::Concern

  def current_cart
    if user_signed_in?
      @current_cart = find_cart
      @current_cart ||= new_cart unless @current_cart
    else
      @current_cart = Cart.new
    end
    session[:cart_id] = @current_cart.id
  end

  def find_cart
    @cart = Cart.find_by(user_id: current_user.id)
  end

  def new_cart
    @current_cart = Cart.new
    @current_cart.user_id = current_user.id
    @current_cart.save
    @current_cart
  end
end
