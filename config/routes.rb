# frozen_string_literal: true

Rails.application.routes.draw do
  root 'items#index'
  resources :items, except: :index
  resources :tasks

  namespace :admin do
    resources :items
  end

  resources :cart_items, only: %i[create destroy]
  resources :items, only: :update do
    resources :cart_items, only: %i[create update]
  end
  resources :checkout, controller: :cart_items, only: :index
  # resources :checkouts, only: :create
  # resource :checkout, controller: :checkouts,  only: :create
  resource :checkout, controller: :orders, only: :create

  scope '/admin' do
    resources :orders, only: %i[index show]
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
