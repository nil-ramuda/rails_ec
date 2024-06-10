class PromotionCode < ApplicationRecord
  with_options presence: true do
    validates :code, length: { maximum: 7, message: 'は7桁で作成してください' },
                     format: { with: /\A[a-z0-9]+\z/i, message: 'は英文字のみで作成してください' }
    validates :discount, numericality: { only_integer: true, greater_than_or_equal_to: 100, less_than_or_equal_to: 1000,
                                         message: '割引額は100円〜1000円の範囲で設定してください' }
  end
end
