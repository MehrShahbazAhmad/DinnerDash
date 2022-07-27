# frozen_string_literal: true

module Api
  module V1
    class RestaurantSerializer < ActiveModel::Serializer
      attributes :id, :title
    end
  end
end
