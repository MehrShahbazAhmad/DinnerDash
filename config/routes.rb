# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :restaurants do
    resources :items
  end

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
    end
  end

  root 'items#index'
end
