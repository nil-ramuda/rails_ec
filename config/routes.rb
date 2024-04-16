# frozen_string_literal: true

Rails.application.routes.draw do
  root 'items#index'
  resources :items, except: :index
  resources :tasks

  namespace :admin do
    resources :items
  end

  resources :cart_items, only: %i[create destroy]
  resources :checkout, controller: 'cart_items', only: :index
end
