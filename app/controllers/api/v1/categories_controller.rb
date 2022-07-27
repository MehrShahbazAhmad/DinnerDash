# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < Api::V1::BaseController
      def index
        @categories = Category.all
        render json: @categories
      end
    end
  end
end
