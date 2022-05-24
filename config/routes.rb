# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :restaurants do
    resources :items
  end

  get 'home/index'
  root 'items#index'
end
