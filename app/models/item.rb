class Item < ApplicationRecord
  has_many_attached :images
  enum status: {active: 0, closed: 1}

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, numericality: {greater_than: 0, less_than: BigDecimal(10**3)}
end
