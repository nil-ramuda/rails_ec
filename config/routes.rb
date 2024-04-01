# frozen_string_literal: true

Rails.application.routes.draw do
  root 'items#index'
  resources :items
  resources :tasks

  namespace :admin do
    resources :items
  end

  resources :carts

  resources :cart_items do
    resources :carts, only: [:create, :destroy]
  end
end
