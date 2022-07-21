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
require 'test_helper'

class RestaurantItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
