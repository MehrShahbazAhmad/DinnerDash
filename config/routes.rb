# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :restaurants do
    resources :items
  end

  post '/items/:item_id/categories/:id/add_item', to: 'categories#add_item'
  delete '/items/:item_id/categories/:id/delete_item', to: 'categories#delete_item'

  resources :categories

  root 'items#index'
end
