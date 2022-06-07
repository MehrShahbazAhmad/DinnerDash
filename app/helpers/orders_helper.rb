# frozen_string_literal: true

module OrdersHelper
  def calculate_total(order)
    total = 0
    order.order_items.each do |item|
      total += calculate_item_total(item)
    end
    total
  end
end
