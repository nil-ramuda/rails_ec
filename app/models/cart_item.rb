# frozen_string_literal: true

class CartItem < ApplicationRecord
  belongs_to :item
  # belongs_to :item, class_name: 'Item'
  # belongs_to :item, foreign_key: 'item_id'
  belongs_to :cart
  # belongs_to :cart, class_name: 'Cart'
  # belongs_to :cart, foreign_key: 'cart_id'
  # validates :quantity, presence: true
  validates :cart_id, presence: true
  validates :item_id, presence: true
end
