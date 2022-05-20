class Restaurant < ApplicationRecord
  has_many :restaurant_items
  has_many :items, through: :restaurant_items

  validates :title, presence: true, uniqueness: true
end
