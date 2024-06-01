class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  with_options presence: true do
    validates :last_name, length: { maximum: 10, message: 'は10文字以内で入力してください' }
    validates :first_name, length: { maximum: 10, message: 'は10文字以内で入力してください' }
    validates :user_name, length: { maximum: 10, message: 'は10文字以内で入力してください' }, format: { with: /\A[a-z0-9]+\z/i, message: 'は英文字のみが使えます' }
    validates :email, length: { maximum: 255, message: 'は255文字以内で入力してください' }, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'は有効なものを入力してください' }
    validates :required_address, length: { maximum: 30, message: 'は30文字以内で入力してください' }
    validates :country
    validates :prefecture
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフンを含めて半角数字で入力してください' }
    validates :credit_card_number, length: { is: 15, message: 'は15桁で入力してください' }, numericality: { only_integer: true, message: 'は半角数字で入力してください' }
    validates :cvv, length: { is: 3, message: 'は3桁で入力してください' }, numericality: { only_integer: true, message: 'は半角数字で入力してください' }
    validates :total_price
  end
  validates :optional_address, length: { maximum: 30, message: 'は30文字以内で入力してください' }
end
