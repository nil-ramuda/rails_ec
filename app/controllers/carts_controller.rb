class CartsController < ApplicationController
  # before_action :set_cart
  def new
    @cart = Cart.new
  end

  def create
    # item = Item.find(params[:id])
    # item_id = @item.id
    # @cart = Cart.new(cart_params)
    @cart = Cart.new
    if @cart.save
      session[:cart_id] = @cart.id
      redirect_to items_path, notice: 'カートに入れました'

    # else
    #   render 'items/new'
    end
  end

  private

  # def set_cart
  #   @cart = Cart.new
  #   session[:cart_id] = @cart.id
  # end

  def cart_params
    # item = Item.find(params[:id])
    params.require(:cart).merge(item_id: item.id)
  end

end
