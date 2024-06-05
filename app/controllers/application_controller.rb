# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_cart, :count_total

  private

  def set_cart
    @total_price = 0
    @cart = Cart.find_by(id: session[:cart_id])
    return unless @cart.nil?

    @cart = Cart.create
    session[:cart_id] = @cart.id
  end

  def count_total
    @total_quantity = @cart.cart_items.sum(:quantity)
    @cart_items = @cart.cart_items
    @total_price = @cart_items.to_a.sum { |cart_item|  cart_item.quantity * cart_item.item.price }
  end

  def basic_authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      user_name == ENV['ADMIN_USER_NAME'] && password == ENV['ADMIN_PASSWORD']
    end
  end
end
