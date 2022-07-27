# frozen_string_literal: true

module Api
  module V1
    class OrderSerializer < ActiveModel::Serializer
      attributes :id
    end
  end
end
