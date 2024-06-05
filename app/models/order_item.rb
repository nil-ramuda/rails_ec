# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :order
  with_options presence: true do
    validates :name, length: { maximum: 20 }
    validates :price, numericality: { less_than_or_equal_to: 1000 }
    validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 99 }
  end
end
