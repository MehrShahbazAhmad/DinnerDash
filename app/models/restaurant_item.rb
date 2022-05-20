class RestaurantItem < ApplicationRecord
  belongs_to :item
  belongs_to :restaurant
end
