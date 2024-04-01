# frozen_string_literal: true

class Item < ApplicationRecord
  has_one_attached :image
  # has_many :cart_item
  has_many :cart_items, dependent: :destroy
  # has_many :cart, through: :cart_item
  # has_many :carts, through: :cart_items, dependent: :destroy
  validates :name, presence: true, length: { maximum: 20 }
  validates :price, presence: true, numericality: { less_than_or_equal_to: 1000 }
  validates :detail, presence: true, length: { maximum: 100 }
end
