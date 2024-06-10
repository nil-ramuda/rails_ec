# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_cart, :count_total
  before_action :code_exists
  before_action :redeem, if: proc { @promotion_code.present? }

  private

  def set_cart
    @total_price = 0
    @cart = Cart.find_by(id: session[:cart_id])
    return if @cart.present?
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end

  def count_total
    @total_quantity = @cart.cart_items.sum(:quantity)
    @cart_items = @cart.cart_items
    @total_price = @cart_items.to_a.sum { |cart_item| cart_item.quantity * cart_item.item.price }
  end

  def code_exists
    session[:code] ||= params[:code]
    return unless session[:code]
    @promotion_code = PromotionCode.find_by(code: session[:code])
    unless @promotion_code
      session[:code] = nil
      flash.now[:alert] = 'プロモーションコードが正しくありません'
      @order = Order.new
      render 'cart_items/index', status: :unprocessable_entity
    end
  end

  def redeem
    @total_price > @promotion_code.discount ? @total_price -= @promotion_code.discount : @total_price = 0
  end

  def basic_authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      user_name == ENV['ADMIN_USER_NAME'] && password == ENV['ADMIN_PASSWORD']
    end
  end
end
