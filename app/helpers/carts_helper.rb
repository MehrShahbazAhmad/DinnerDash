# frozen_string_literal: true

module CartsHelper
  def calculate_item_quantaty(id)
    session[:cart_id].count(id)
  end

  def calculate_item_total_guest(id, price)
    session[:cart_id].count(id) * price
  end

  def calculate_guest_total(cart)
    cart.sum { |item| calculate_item_total_guest(item.id, item.price) }
  end
end
