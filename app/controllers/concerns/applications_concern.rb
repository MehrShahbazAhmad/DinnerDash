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
    Cart.find_by(user_id: current_user.id)
  end

  def new_cart
    @current_cart = Cart.create(user_id: current_user.id)
    fill_in_cart unless session[:cart_id].empty?
    @current_cart
  end

  def fill_in_cart
    CartItem.create(hash_of_cart_items)
  end

  def hash_of_cart_items
    session[:cart_id].uniq.map do |item|
      { item_id: item, quantity: count_items(item), cart_id: @current_cart }
    end
  end

  def count_items(id)
    session[:cart_id].count(id)
  end
end
