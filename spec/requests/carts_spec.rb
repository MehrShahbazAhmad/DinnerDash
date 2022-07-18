# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  let(:user) { create(:user) }
  let(:cart) { FactoryBot.create(:cart) }

  before do
    request.env['HTTP_REFERER'] = 'where_i_came_from'
    @request.env['devise.mappings'] = Devise.mappings[:user]
    sign_in user
    session[:cart_id] = []
  end

  describe 'GET /cart/id' do
    it 'Cart Show' do
      get :show, params: { format: cart.id }
      expect(response).to have_http_status(:ok)
      expect(response).to render_template('show')
    end
  end

  describe 'DELETE /cart/id' do
    it 'Cart Delete' do
      delete :destroy
    end
  end
end
