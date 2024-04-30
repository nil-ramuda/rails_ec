# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :pick_items

  def new
    @cart_item = @cart.cart_items.new
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find_by(id: params[:id])
    @latest_item = Item.last
    @cart_item = @cart.cart_items.find_or_initialize_by(item_id: params[:id])
  end

  private

  def pick_items
    @cart = Cart.find_by(id: session[:cart_id])
    if @cart.nil?
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
    @item_ids = @cart.cart_items.pluck(:item_id)
  end
end
