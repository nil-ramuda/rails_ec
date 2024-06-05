# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_cart, :count_total
  before_action :basic_authenticate, only: %i[index show]

  def create
    ActiveRecord::Base.transaction do
      @order = Order.new(order_params)
      if @order.save!
        orders = @cart_items.map do |cart_item|
          order_item_params = { order_id: @order.id, name: cart_item.item.name, price: cart_item.item.price,
            quantity: cart_item.quantity }
          raise 'OrderItem is invalid' if OrderItem.new(order_item_params).invalid?
          order_item_params
        end
        OrderItem.insert_all(orders)
        OrderItemMailer.with(order: @order).order_item_mail.deliver_now
        @cart.destroy
        redirect_to root_path
        flash[:notice] = 'ご購入ありがとうございます。明細をメールアドレスにお送りしました'
      else
        render 'cart_items/index', status: :unprocessable_entity
      end
    end
    rescue => e
      p e.message
  end

  def index
    @orders = Order.order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(
      :last_name,
      :first_name,
      :user_name,
      :email,
      :required_address,
      :optional_address,
      :country,
      :prefecture,
      :zip_code,
      :credit_card_number,
      :cvv
    ).merge(total_price: @total_price)
  end
end
