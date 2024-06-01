# frozen_string_literal: true

class CartItemsController < ApplicationController

  def new
    @order = Order.new
  end

  # def index; end
  def index
    @order = Order.new
  end

  def create
    @cart_item = @cart.cart_items.create(cart_item_params)
    flash[:notice] = "カートに#{@cart_item.item.name}を#{params[:cart_item][:quantity].to_i}個追加しました"
    redirect_to action: params[:action], controller: params[:controller]
  end

  def update
    @cart_item = @cart.cart_items.find_by(item_id: params[:item_id])
    @cart_item.quantity += params[:cart_item][:quantity].to_i
    @cart_item.save
    flash[:notice] = "カートに#{@cart_item.item.name}を#{params[:cart_item][:quantity].to_i}個追加しました"
    redirect_to action: params[:action], controller: params[:controller]
  end

  def destroy
    @cart_item = @cart.cart_items.find_by(item_id: params[:item_id])
    @cart_item.destroy
    flash[:notice] = "カートから#{@cart_item.item.name}を削除しました"
    redirect_to checkout_index_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity).merge(item_id: params[:item_id])
  end
end
