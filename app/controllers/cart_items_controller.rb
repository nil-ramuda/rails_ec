# frozen_string_literal: true

class CartItemsController < ApplicationController
  before_action :set_cart

  def index
    @cart_items = @cart.cart_items
    @cart_items.to_a.map! do |cart_item|
      @total_price += cart_item.quantity * cart_item.item.price
    end
  end

  def create
    @cart_item = @cart.cart_items.create(cart_item_params)
    flash[:notice] = "カートに#{@cart_item.item.name}を#{params[:quantity].to_i}個追加しました"
    redirect_to action: params[:action], controller: params[:controller]
  end

  def update
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.quantity += params[:quantity].to_i
    @cart_item.save
    flash[:notice] = "カートに#{@cart_item.item.name}を#{params[:quantity].to_i}個追加しました"
    redirect_to action: params[:action], controller: params[:controller]
  end

  def destroy
    @cart_item = @cart.cart_items.find_by(item_id: params[:item_id])
    @cart_item.destroy
    flash[:notice] = "カートから#{@cart_item.item.name}を削除しました"
    redirect_to checkout_index_path
  end

  private

  def set_cart
    @total_price = 0
    @cart = Cart.find_by(id: session[:cart_id])
    if @cart.nil?
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end

  def cart_item_params
    params.permit(:quantity, :item_id)
  end
end
