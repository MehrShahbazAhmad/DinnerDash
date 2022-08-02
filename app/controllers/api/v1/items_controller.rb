# frozen_string_literal: true

module Api
  module V1
    class ItemsController < Api::V1::BaseController
      def index
        items = Item.all
        items = items.sort_by_title
        render json: items
      end

      def show
        item = Item.find(params[:id])
        render json: item
      end
    end
  end
end
