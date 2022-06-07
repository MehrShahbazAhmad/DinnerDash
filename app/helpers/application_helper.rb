# frozen_string_literal: true

# Home Controller
module ApplicationHelper
  def calculate_item_total(item)
    item.quantity * item.item.price
  end
end
