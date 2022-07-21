# frozen_string_literal: true

# == Schema Information
#
# Table name: order_items
#
#  id         :bigint           not null, primary key
#  item_id    :bigint
#  order_id   :bigint
#  quantity   :integer          default(1), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order
end
