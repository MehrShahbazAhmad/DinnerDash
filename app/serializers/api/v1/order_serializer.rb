# frozen_string_literal: true

module Api
  module V1
    class OrderSerializer < ActiveModel::Serializer
      attributes :id, :status
      has_many :items
      belongs_to :user
    end
  end
end
