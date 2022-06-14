# frozen_string_literal: true

module ApplicationsConcern
  extend ActiveSupport::Concern

  def current_cart
    if user_signed_in?
      @current_cart = find_cart
      @current_cart ||= new_cart unless @current_cart
      session[:cart_id] = @current_cart.id
    else
      session[:cart_id] ||= []
    end
  end

  def find_cart
    @cart = Cart.find_by(user_id: current_user.id)
  end

  def new_cart
    @current_cart = Cart.new
    @current_cart.user_id = current_user.id
    @current_cart.save
    fill_in_cart unless session[:cart_id].empty?
    @current_cart
  end

  def fill_in_cart
    t = session[:cart_id].uniq
    t.each do |item|
      cart_item = CartItem.new
      cart_item.cart = @current_cart
      cart_item.item = Item.find(item)
      cart_item.quantity = session[:cart_id].count(item)
      cart_item.save
    end
  end
end
