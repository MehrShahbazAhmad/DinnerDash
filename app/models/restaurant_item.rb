# frozen_string_literal: true

# == Schema Information
#
# Table name: restaurant_items
#
#  id            :bigint           not null, primary key
#  item_id       :bigint
#  restaurant_id :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class RestaurantItem < ApplicationRecord
  belongs_to :item
  belongs_to :restaurant
end
