# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  let(:user) { create(:user) }
  let(:cart) { FactoryBot.create(:cart) }

  before do
    request.env['HTTP_REFERER'] = 'where_i_came_from'
    request.env['devise.mappings'] = Devise.mappings[:user]
    sign_in user
    session[:cart_id] = []
  end

  describe 'GET /cart/id' do
    it 'tests the status of show method of the cart' do
      get :show, params: { format: cart.id }
      expect(response).to render_template('show')
    end
  end

  describe 'DELETE /cart/id' do
    it 'tests the status of destroy method of the cart' do
      delete :destroy
      expect(response).to redirect_to(root_path)
    end
  end
end
