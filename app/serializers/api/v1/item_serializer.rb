# frozen_string_literal: true

module Api
  module V1
    class ItemSerializer < ActiveModel::Serializer
      attributes :id, :title, :description, :price
    end
  end
end
