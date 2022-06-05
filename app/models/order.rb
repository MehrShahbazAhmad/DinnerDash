# frozen_string_literal: true

# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

  enum status: { active: 0, completed: 1, closed: 2 }
end
