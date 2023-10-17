# frozen_string_literal: true

module Api
  module V1
    class BaseController < ActionController::API
      rescue_from ActiveRecord::RecordNotFound, with: :not_found

      def not_found
        api_error(status: 404, errors: 'Not found')
      end
    end
  end
end
