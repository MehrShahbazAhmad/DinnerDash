# frozen_string_literal: true

require 'cloudinary'
module Api
  module V1
    class ItemSerializer < ActiveModel::Serializer
      include Rails.application.routes.url_helpers
      attributes :id, :title, :description, :price, :url
      has_many :restaurants
      has_many :categories

      def url
        temp = []
        object.images.each do |image|
          temp << "https://res.cloudinary.com/shahbazdevsinc/image/upload/v1655205984/#{ActiveStorage::Blob.find(image.blob_id).key}.jpeg"
        end
        temp
      end
    end
  end
end
