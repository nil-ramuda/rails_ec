# frozen_string_literal: true

class Item < ApplicationRecord
  has_one_attached :image
  has_many :cart_items, dependent: :destroy
  validates :name, presence: true, length: { maximum: 20 }
  validates :price, presence: true, numericality: { less_than_or_equal_to: 1000, message: 'は1000以下の半角数字で入力してください。' }
  validates :detail, presence: true, length: { maximum: 100 }
end
