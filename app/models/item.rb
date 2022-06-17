# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  description :string           not null
#  price       :decimal(5, 2)    not null
#  status      :integer          default("active"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Item < ApplicationRecord
  has_many_attached :images

  has_many :restaurant_items, dependent: :destroy
  has_many :restaurants, through: :restaurant_items

  has_many :category_items, dependent: :destroy
  has_many :categories, through: :category_items

  has_many :cart_items, dependent: :destroy

  has_many :order_items, dependent: :destroy

  enum status: { active: 0, closed: 1 }

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, numericality: { greater_than: 0, less_than: BigDecimal(10**3) }

  scope :search, ->(search) { where('lower(title) LIKE ?', "%#{search}%") }
  scope :sort_by_title, -> { order(title: :asc) }
end
