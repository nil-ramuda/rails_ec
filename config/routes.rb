# frozen_string_literal: true

Rails.application.routes.draw do
  root 'items#index'
  resources :items
  resources :tasks

  namespace :admin do
    resources :items
  end

  resources :carts, only: [:index]

  resources :cart_items, only: [:create, :destroy]
  # resources :cart_items, only: [:create, :destroy, :index]
  resources :cart_items, only: [:index], path: 'checkout'
end
