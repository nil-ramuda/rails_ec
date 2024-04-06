class CartItemsController < ApplicationController
  before_action :set_cart

  def index
    @cart_items = CartItem.where(cart_id: session[:cart_id])
    # @total_quantity = @cart_items.group(:item_id).sum
    # @cart_items.map do |cart_item|
    #   #  = Item.find_by(id: cart_item.item_id).price
    #   # cart_item.quantity
    #   @added_item_name = cart_item.item.name
    #   # @item_price = Item.find_by(id: cart_item.item_id).price * cart_item.quantity
    #   @total_price = cart_item.item.price * cart_item.quantity
    # end

    # @cart_items.each do |cart_item|
    #   @added_item_name = cart_item.item.name
    #   @total_price = cart_item.item.price * cart_item.quantity
    # end
  end

  def create
    # p "アイテムIDは#{params[:item_id]},セッションIDは#{session[:cart_id]},指定した数量は#{params[:quantity]}です"
    if CartItem.find_by(item_id: params[:item_id], cart_id: session[:cart_id])
      # p "すでに同じ商品がカートに入っています"
      @cart_item = CartItem.find_by(item_id: params[:item_id], cart_id: session[:cart_id])
      # p "#{@cart_item.quantity}個今入っています"
      # p "#{params[:quantity].to_i}個追加しようとしています"
      # p "合計#{@cart_item.quantity + params[:quantity].to_i}個になります"
      @cart_item.quantity += params[:quantity].to_i
      @cart_item.save
    else
      @cart_item = @cart.cart_items.create(cart_item_params)
    end
  end

  private
    def set_cart
      unless Cart.find_by(id: session[:cart_id])
        p "カートが無いので作ります"
        @cart = Cart.new
        @cart.save
        session[:cart_id] = @cart.id
      else
        p "カートはすでにあります"
        @cart = Cart.find_by(id: session[:cart_id])
      end
    end

    def cart_item_params
      params.permit(:quantity, :item_id)
    end
end
