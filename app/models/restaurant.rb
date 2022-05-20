# == Schema Information
#
# Table name: restaurants
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Restaurant < ApplicationRecord
  has_many :restaurant_items
  has_many :items, through: :restaurant_items

  validates :title, presence: true, uniqueness: true
end
