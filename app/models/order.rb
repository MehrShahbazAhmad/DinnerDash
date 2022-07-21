# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  status     :integer          default("ordered"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

  enum status: { ordered: 0, paid: 1, cancelled: 2, completed: 3 }
end
