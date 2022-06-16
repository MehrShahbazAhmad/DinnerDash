# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :items do
    get :top_items, on: :collection
  end
  resources :restaurants

  resources :categories do
    resources :items, only: %i[add_item delete_item] do
      member do
        post :add_item
        delete :delete_item
      end
    end
  end

  resource :carts, only: %i[show destroy] do
    resource :cart_items, only: %i[add_quantity reduce_quantity] do
      post :add_quantity
      post :reduce_quantity
      post :remove_item
      post :clear_cart
    end
  end

  resources :orders, except: %i[destroy] do
    resources :order_items, only: %i[add_item] do
      post :add_item
    end
  end

  root 'items#index'
end
