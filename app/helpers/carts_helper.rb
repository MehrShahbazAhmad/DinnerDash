# frozen_string_literal: true

module CartsHelper
  def calculate_total_cart(cart)
    total = 0
    cart.cart_items.each do |item|
      total += calculate_item_total(item)
    end
    total
  end
end
