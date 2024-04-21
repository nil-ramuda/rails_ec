# frozen_string_literal: true

class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart
  validates :quantity, presence: true,
                       numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 99 }
  validates :cart_id, presence: true
  validates :item_id, presence: true
end
