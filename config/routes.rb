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

  root 'items#index'
end
