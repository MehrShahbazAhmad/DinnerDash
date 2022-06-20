# frozen_string_literal: true

# == Schema Information
#
# Table name: category_items
#
#  id          :bigint           not null, primary key
#  item_id     :bigint
#  category_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class CategoryItem < ApplicationRecord
  belongs_to :item
  belongs_to :category
end
