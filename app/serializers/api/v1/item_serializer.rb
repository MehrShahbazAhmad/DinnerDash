# frozen_string_literal: true

require 'cloudinary'
module Api
  module V1
    class ItemSerializer < ActiveModel::Serializer
      include Rails.application.routes.url_helpers
      attributes :id, :title, :description, :price, :order_count, :url
      has_many :restaurants
      has_many :categories

      def url
        temp = []
        object.images.each do |image|
          temp << Cloudinary::Utils.cloudinary_url(ActiveStorage::Blob.find(image.blob_id).key)
        end
        temp
      end
    end
  end
end
