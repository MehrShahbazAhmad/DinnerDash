# frozen_string_literal: true

module CartsHelper
  def calculate_total_cart(cart)
    total = 0
    cart.cart_items.each do |item|
      total += calculate_item_total(item)
    end
    total
  end

  def calculate_item_quantaty(id)
    session[:cart_id].count(id)
  end

  def calculate_item_total_guest(id, price)
    session[:cart_id].count(id) * price
  end

  def calculate_guest_total(cart)
    total = 0
    cart.each do |item|
      total += calculate_item_total_guest(item.id, item.price)
    end
    total
  end
end
