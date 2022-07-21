# frozen_string_literal: true

# == Schema Information
#
# Table name: cart_items
#
#  id         :bigint           not null, primary key
#  item_id    :bigint
#  cart_id    :bigint
#  quantity   :integer          default(1), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item
end
