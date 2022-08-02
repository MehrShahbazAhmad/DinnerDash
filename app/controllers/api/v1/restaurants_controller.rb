# frozen_string_literal: true

module Api
  module V1
    class RestaurantsController < Api::V1::BaseController
      def index
        @restaurants = Restaurant.all
        render json: @restaurants
      end
    end
  end
end
