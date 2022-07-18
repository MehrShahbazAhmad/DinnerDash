# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:items) { create_list :item, 3 }

  let(:item) { FactoryBot.create(:item) }

  let(:user) { create(:user) }

  let(:cart) { FactoryBot.create(:cart) }

  let(:restaurant) { FactoryBot.create(:restaurant) }

  let(:category) { FactoryBot.create(:category) }

  before do
    request.env['HTTP_REFERER'] = 'where_i_came_from'
    @request.env['devise.mappings'] = Devise.mappings[:user]
    sign_in user
    session[:cart_id] = []
  end

  describe 'GET /items' do
    it 'items index' do
      get :index
      expect(response).to have_http_status(:ok)
      expect(response).to render_template('index')
    end
  end

  describe 'GET /items' do
    it 'items index with search params' do
      get :index, params: { search: 'B' }
      expect(response).to redirect_to('where_i_came_from')
    end
  end

  describe 'GET /item/id' do
    it 'Item Show' do
      get :show, params: { id: item.id }
      expect(response).to have_http_status(:ok)
      expect(response).to render_template('show')
    end
  end

  describe 'GET /item/new' do
    it 'Item New' do
      get :new, params: { restaurant_id: restaurant.id }
    end
  end

  describe 'GET /item/new' do
    it 'Item Edit' do
      get :edit, params: { restaurant_id: restaurant.id, id: item.id }
    end
  end

  describe 'POST /item/create' do
    it 'Item Create' do
      post :create,
           params: { item: { title: Faker::Name.unique.name, description: Faker::Lorem.sentence(word_count: 1), price: 6.5,
                             categories: category.id, restaurant_id: restaurant.id, pictures: [fixture_file_upload(Rails.root.join('app/assets/images/defult.jpeg'), 'image/jpeg')] } }
      expect(item).to be_valid
    end
  end

  describe 'PATCH /item/id' do
    it 'Item Update' do
      patch :update,
            params: { id: item.id,
                      item: { title: 'Changed 1', description: 'is Changed by the Tester', price: 5.5, status: 'closed',
                              restaurant_id: item.restaurants.first.id } }
      expect(item).to be_valid
    end
  end

  describe 'DELETE /item/id' do
    it 'Item Delete' do
      delete :destroy, params: { id: item.id }
    end
  end

  describe 'POST /items/add_item' do
    it 'Add Item to Category' do
      post :add_item, params: { id: item.id, category_id: category.id }
      expect(response).to redirect_to(category_path(category))
    end
  end

  describe 'DELETE /items/delete_item' do
    it 'Delete Item From Category' do
      delete :delete_item, params: { id: item.id, category_id: category.id }
      expect(response).to redirect_to(category_path(category))
    end
  end
end
