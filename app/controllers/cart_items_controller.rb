class CartItemsController < ApplicationController
  before_action :set_cart

  def create
    # @cart_item = CartItem.new(cart_item_params)

    @cart_item = @cart.cart_items.create(quantity: params[:quantity].to_i, item_id: params[:item_id].to_i, cart_id: session[:cart_id])

    # if params[:quantity].to_i == 1
      # @cart_item = @cart.cart_items.create(quantity: params[:quantity].to_i, item_id: params[:item_id].to_i, cart_id: session[:cart_id])
    # else
    #   @cart_item = @cart.cart_items.create(quantity: params[:quantity].to_i, item_id: params[:item_id].to_i, cart_id: session[:cart_id])
    # end
    # if @cart_item.save
    #   flash[:notice] = "カートに入れました"
    # else
    #   flash[:notice] = "カートに入れれませんでした"
    # end
  end

  private
    def set_cart
      @cart = Cart.new
      @cart.save
      session[:cart_id] = @cart.id
    end

    # def cart_item_params
    #   # { quantity: params[:quantity].to_i, item_id: params[:item_id].to_i, cart_id: session[:cart_id] }
    #   params.require(:cart_item).permit(:quantity, :item_id, :cart_id)
    # end
end
