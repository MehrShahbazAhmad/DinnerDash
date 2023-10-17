# frozen_string_literal: true

module Api
  module V1
    class RestaurantSerializer < ActiveModel::Serializer
      attributes :id, :title
      has_many :items
    end
  end
end
