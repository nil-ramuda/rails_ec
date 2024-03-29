# frozen_string_literal: true

Rails.application.routes.draw do
  root 'items#index'
  resources :items
  resources :tasks

  namespace :admin do
    resources :items
  end
end
