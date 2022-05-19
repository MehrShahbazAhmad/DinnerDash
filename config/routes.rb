# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :items
  get 'home/index'
  root 'home#index'
end
