# frozen_string_literal: true

# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

  enum status: { ordered: 0, paid: 1, cancelled: 2, completed: 3 }
end
